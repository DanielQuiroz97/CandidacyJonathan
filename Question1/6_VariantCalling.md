
# Variant Calling

```
mkdir VC

ls 7_Alignment/Read_group/*.bam  | awk -F '/' '{print $3}' | awk -F '.' '{print $1}' | sort | uniq > 8_Variant_calling/ID
cat 8_Variant_calling/ID
```