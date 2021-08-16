Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6A03EDF4A
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Aug 2021 23:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhHPV35 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Aug 2021 17:29:57 -0400
Received: from mail-mw2nam08on2067.outbound.protection.outlook.com ([40.107.101.67]:11104
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231316AbhHPV34 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Aug 2021 17:29:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6nyDWVkXXPH5SQKQCQeN8TdYnDi1EI8V1p7LGZ9SEz6+IlqVQfI+sqHyzo3hbEeUZGRh4RuSybzlQ8JSeaXpjr0E5cF1TVVmnxqVI2dzZhWj6E71SHLhXMw8LOYuVM4NOh2CELHAYWGq9+Oofz86li1KNwZqXOB4WDnFKBjJMhVe5pwSdd9zd1rsleaurKIg3brwMsBEVgndMFw37cG4fbUQX5J3RWw7BNx7tZ51+C3jd1FYhHod60okCJ5QU3MHJSifpXKMPaZpifglUnLJsuFP9sPnl3OX5ijkKOqTGPF3YmbTVEa4w4mrWSo1gPVtzRRg8Zdlqg2xY1H+Hl/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrK5lCcqRoR+RHH52l3nHMJmGOZzSpA+4mJp/F8AGaA=;
 b=mOyaxwdBZDQEQnKGbwA2YGRD2iZWASfxUSvA2foUk5ijNZIzMwb1oi7NVSGOGyESWY4E/L8hpbOspxdK05qXNQ4bCz+aZvxjN3FIeslmU4NIOPmdmrCFQb8iJ3zzrQ+d+QJ3Q1VXgNalOtl4g5r+Je1qb+cEB71zJLYWpE4JzHwijzIiiQlOXhWuY8kYFkiC34UnU+cu8mw/k26+TvfpgSDHrVih9xfdj2T6y4TFzBdlzJ1ohcvMjj+yBaQlz+aNoXoq6JXYDZhiktuq1gdxe0rWoy9hgn4bJe7nLlZa7oZ5nDgBQ9P/hPX/26ulB1dkLRVELEkvKua4oHgNyyW9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrK5lCcqRoR+RHH52l3nHMJmGOZzSpA+4mJp/F8AGaA=;
 b=vgQsMlDTuDxGs7bGQIYoBp3Y8Po7L8cu9BnmwvMQnkUxXbp9fGRFaBf6e6GDIw0DfeLMSHrucYAgPZf8PDqQK24N7c29IS/wHCALgwg6eVgUFY1HY7VoCUk5lUgs25nU7cryp2yxi80pG4EFe2JDCGWfoRh26oOeFBjb7ntHzig=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 21:29:21 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 21:29:21 +0000
Subject: Re: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        rrichter@amd.com, thomas.lendacky@amd.com
References: <20210813213216.54780-1-Terry.Bowman@amd.com>
 <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <396d4558-9ddf-55e8-75bf-cb1a15de393a@amd.com>
Date:   Mon, 16 Aug 2021 16:29:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::6) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.65] (165.204.77.1) by SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 21:29:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5df4033e-ac37-406d-857b-08d960fce928
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45112662F685075E752AFF5D83FD9@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6a6nF79tyloJf+uRnD2hODzMBiTctdRrLXFk19t9mlP0J9SxMPP0Vq4KaEnU854zOmuZ8W7p/utwSp4OkdymD6zeTHsslzPbwTdxh7wtO/MT/978gC7APp0oMbLV8ZtrKfDrPIRQ4VA+W4Eqy3XEdZR/x3odba2vYg1zj/beMaSdpvR5FD9ZaxDXjAp3tNRTr3x68SdCv6Kl4P6L8ZFplVDkd7JRz3E5ihXaT/ALk0qRgresDmiMQIVO9AFOr/s3wzYucQ1bFgHuo/4sgMbXVVm44mh2N7oS9bOLH61CPqiJtBUpDnEtGVPZyUTpTlY+H/4FHemmST+TmIPrzpF1v7K8L06AqwfB5RwizA0K+f6hz+Ni45f7hByqTMjnQ2BYlSaUf/A1aL0K9Bx9uSrxZY03OQjlFegpO/bXa6aZ64ybCRP2XxvTNu0s66ucZ/ySjMzZqiyakmju32v5vP/8+8J+j+EySMPegrYsPgYFUCkFfhlGU1EFNxwE3hCyAiXCYxZaxFZFTEabqMRiLp5F6NMjQLcqykNMSrFKwC6Sbd0CY7Q78qQlkUqgnqpBNxVtwNRlXJgQnuw/v52IbtjwD4ueTZn5cf3i5rPPYJGHJkATFJMRzG983avaCvioZ99RkPwTpi039UalU797vNtx2dGaAAUJQPcXLTsczrHA3qdhRg6getAgBjnohMX3efWLOJ3i0RA3l17UGxwyxV558V94rcf7tS3TNUUZdaMH7VtMXolJIGFq/8u94nz6mr0cf0oLhQ3MFMxGRi/rVUS9iLpt/B37Ge2QYdkvMJR5SqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(5660300002)(316002)(2906002)(4326008)(66946007)(2616005)(16576012)(52116002)(956004)(38100700002)(36756003)(38350700002)(30864003)(186003)(66556008)(53546011)(478600001)(66476007)(8676002)(8936002)(31696002)(31686004)(6486002)(83380400001)(86362001)(26005)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bldQSkxKNUJYZ1MyamgzajBYU2VkUldIczQ0MDdKRzNZdGZDZGlVMDJHa1Q5?=
 =?utf-8?B?azNzSWVOdVQ4czNMMnlpZmpUWGNqYVZISTFzOFczeis2S1NEN0ZQbm1mc2Mz?=
 =?utf-8?B?ck5lUGRkdnFkakRmclBqcFNuY2ZpVzVtWnJWTW55K24rS295QUl3MDYyWTRa?=
 =?utf-8?B?YmhPV1JzRWZzY3YydXFkcEFGbksyWlhNN3Eya1NBZFdxaWdWZEQwdzEySW9o?=
 =?utf-8?B?aFRJRDY2K3VYZEJSN1duR0syaVFhZGJJRjBiUTV0SDl4eUJ4eVROenlaa3Bh?=
 =?utf-8?B?LytUV0c0SlU4a2ZOQlVRQkh1aGhpWkQ5eHZZSTA0Yk82N21kYS9Odys1WHJa?=
 =?utf-8?B?eHNpeFVmaUdBREw2aWN3cWJWMGNCbWxwejRkbnhPMFlPWThpL0NINElHU3Yx?=
 =?utf-8?B?bytLcVY4K056OTFwVnlMNUhLYVl6YmVWdHlFQm9rOGtFUCtPTVlaR28yVjlM?=
 =?utf-8?B?cGZJYktjN2dmQjB4RFZlcjVYSTREYjFyY0x1c0tiQTJUVlB6NjVCMG9XbGpQ?=
 =?utf-8?B?MmtqK056TDBJVU43YWRTODE5M28wWk1id0dVVThESXRFbUtqdDg0SnpIU0I5?=
 =?utf-8?B?ajVrcWxZSlU4WmJVb3ptK0lVdmlZOG94SnZmdVhtbzVzeVhDdHhrR1VaOHlH?=
 =?utf-8?B?NUJkbjFOaG5Wc2xqZVY2RkVidmJJR3l5TWlpM0NxZkZnSjFOUm1EYTVIWHA2?=
 =?utf-8?B?SHQ3REVoSnNydlVqcGo4MEkwdTdXZU1GZGgxSEdBdEtHdFpSbzI3WmZ0RjUz?=
 =?utf-8?B?VTZXMUlmQnZ6M2RxbVAzUytJV3JKMC8rRGMwdmdDbWxnWXNydTFQY2hrcTlk?=
 =?utf-8?B?eHpCY0p1Rk9jUmR3OWNXSVh0TnhKQ2ZxOGc5V1N3alJlMk8wZWdSbUltY0VR?=
 =?utf-8?B?dHltZnE0b1k2VDBSNWJVNTArM3FLRVNtbGowTHVxNXZNZ2ZBOEllNjlIb1Mw?=
 =?utf-8?B?L3pLaEUzZ3hQSEdLVU9aVEN4ejRWck5TR2QxY1F4bjNDUlRVUVZTOUp6b2Vr?=
 =?utf-8?B?MlVWRnFRWU9Ibkk5NThQSytETDR5WDk4Y1dOMU9iakFZa3kvVnhGdUMzNzlI?=
 =?utf-8?B?Y0x0aXdsU3dHK0RRbW9aSUo5Mjhld1ZRTlByYUhlTEtLczJvUXJnb0thSURm?=
 =?utf-8?B?Q1IrckwzRFpqRGZWaEhSQVhSdm1sZm9tT2ovMVI3aGMxZ1QzYmlzUy9zR3gv?=
 =?utf-8?B?YWRZdXlaTTdJWWp3d3d6T004Mm5uVVRSSFJBakRoYTlSaDJaaE4rNnptVUto?=
 =?utf-8?B?bUxzVWpzNldaUlhoUWd5dERhbWdhVXlJalVqQ1pTU2djWDVOTHdTNVZpYjJT?=
 =?utf-8?B?WHp4THIrK0xjUUNDYVBacU1BMWNnN2QxRzcvalhsUWdGYk1HOEpSRFQ2SXdM?=
 =?utf-8?B?RmE1WjZoMGZRRDFsYmdnTXJEVlBDNnVEUmlUeTBzdlhKRm1kMzduTmR3SE1a?=
 =?utf-8?B?UzJtRkdMYkh3OWpma1B1ZSs0a2t2a1FqMW1Zdy9OSEE5SUs5TGcwRDEwZDBI?=
 =?utf-8?B?L0IyNTNFekZaTndvWnNuVC9Gck9iMmN6YStLaWF5Z0l1QzdPdEdENHh0WlVY?=
 =?utf-8?B?aUZFa3Zpa1JUSlJlWEhoeGU3SXl3a1pvRDB0cUZLVlBPdG0xVEl3NG9pMXVo?=
 =?utf-8?B?d1N5aEFpa09Ga1ZaTHV3ZVh6dTEwekFXVVltY3lWMnViUXlaYUpjeUlTL2ds?=
 =?utf-8?B?aUdhSzhlb1VPRkhlVmQ2UFlJL3ZkaUVJTzZRWkpMN3N2WmlQME8weHIydVZi?=
 =?utf-8?Q?lNYIthVvqqHECL9tjYhEVyXOOkajfKnytZ6hcAL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df4033e-ac37-406d-857b-08d960fce928
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 21:29:21.0463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 756+TCEQ46vSDmDPYPu4mQBCBUaPXSG0bcxvEHzU3vMOrVkgLjDjms63UxBQQNVoxY0+V9PtjwM4vQS7dpmKWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/13/21 5:37 PM, Guenter Roeck wrote:
> On 8/13/21 2:32 PM, Terry Bowman wrote:
>> Use MMIO instead of port I/O during SMBus controller address discovery.
>> Also, update how EFCH capability is determined by replacing a family 
>> check
>> with a PCI revision ID check.
>>
>> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read 
>> accesses to
>> disabled cd6h/cd7h port I/O will return F's and written data is dropped.
>> The recommended workaround to handle disabled cd6h/cd7h port I/O is
>> replacing port I/O with MMIO accesses. The MMIO access method has been
>> available since at least SMBus controllers using PCI revision 0x59.
>>
>> The sp5100_tco driver uses a CPU family match of 17h to determine
>> EFCH_PM_DECODEEN_WDT_TMREN register support. Using a family check 
>> requires
>> driver updates for each new AMD CPU family following 17h. This patch
>> replaces the family check with a check for SMBus PCI revision ID 0x59 and
>> later. Note: Family 17h processors use SMBus PCI revision ID 0x59. The
>> intent is to use the PCI revision ID check to support future AMD 
>> processors
>> while minimizing required driver changes. The caveat with this change is
>> the sp5100_tco driver must be updated if a new AMD processor family 
>> changes
>> the EFCH design or the SMBus PCI ID value doesn't follow this pattern.
>>
>> Tested with forced WDT reset using `cat >> /dev/watchdog`.
>>
> 
> I am sorry, I don't understand why the new code can not use devm functions,
> why the new data structure is necessary in the first place, and why it is
> not possible to improve alignment with the existing code. This will require
> a substantial amount of time to review to ensure that the changes are not
> excessive (at first glance it for sure looks like that to me).
> 
> Guenter
> 

Hi Guenter,

I can change the patch to use devm functions as you mentioned. My
understanding is the patch's reservation and mapping related functions
are the focus. I originally chose not to use devm functions because the
patch's MMIO reserved and mapped resources are not held for the driver
lifetime as is the case for most device managed resources. The
sp5100_tco driver must only hold these MMIO resources briefly because
other drivers use the same EFCH MMIO registers. An example of another
driver using the same registers is the piix4_smbus driver (drivers/i2c
/busses/i2c-piix4.c). This patch can be changed to use the devm
functions but the driver may not benefit from the device management.

The 'struct efch_cfg' addition is needed for MMIO reads/writes as well
as during cleanup when leaving sp5100_region_setup(). This structure was
chosen to contain the data instead of passing multiple parameters to
each EFCH function called.

Do you have any recommendations for how to best improve the alignment?

Regards,
Terry

>> Signed-off-by: Terry Bowman <Terry.Bowman@amd.com>
>> Reviewed-by: Robert Richter <rrichter@amd.com>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/watchdog/sp5100_tco.c | 180 +++++++++++++++++++++++++++-------
>>   drivers/watchdog/sp5100_tco.h |   5 +
>>   2 files changed, 148 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/watchdog/sp5100_tco.c 
>> b/drivers/watchdog/sp5100_tco.c
>> index a730ecbf78cd..cf1d0d96a731 100644
>> --- a/drivers/watchdog/sp5100_tco.c
>> +++ b/drivers/watchdog/sp5100_tco.c
>> @@ -44,6 +44,7 @@
>>   #include "sp5100_tco.h"
>>   #define TCO_DRIVER_NAME    "sp5100-tco"
>> +#define AMD_PCI_SMBUS_REVISION_MMIO             0x59
>>   /* internal variables */
>> @@ -51,6 +52,11 @@ enum tco_reg_layout {
>>       sp5100, sb800, efch
>>   };
>> +struct efch_cfg {
>> +    void __iomem *addr;
>> +    struct resource *res;
>> +};
>> +
>>   struct sp5100_tco {
>>       struct watchdog_device wdd;
>>       void __iomem *tcobase;
>> @@ -161,7 +167,133 @@ static void sp5100_tco_update_pm_reg8(u8 index, 
>> u8 reset, u8 set)
>>       outb(val, SP5100_IO_PM_DATA_REG);
>>   }
>> -static void tco_timer_enable(struct sp5100_tco *tco)
>> +static bool efch_use_mmio(void)
>> +{
>> +    return (sp5100_tco_pci->vendor == PCI_VENDOR_ID_AMD &&
>> +        sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
>> +        sp5100_tco_pci->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
>> +}
>> +
>> +static u8 efch_read_pm_reg8(struct efch_cfg *cfg, u8 index)
>> +{
>> +    if (!cfg->addr)
>> +        return sp5100_tco_read_pm_reg8(index);
>> +
>> +    return readb(cfg->addr + index);
>> +}
>> +
>> +static void efch_update_pm_reg8(struct efch_cfg *cfg,
>> +                u8 index, u8 reset, u8 set)
>> +{
>> +    u8 val;
>> +
>> +    if (!cfg->addr) {
>> +        sp5100_tco_update_pm_reg8(index, reset, set);
>> +        return;
>> +    }
>> +
>> +    val = readb(cfg->addr + index);
>> +    val &= reset;
>> +    val |= set;
>> +    writeb(val, cfg->addr + index);
>> +}
>> +
>> +/* Return SMBus controller's MMIO address on success and 0 on error. */
>> +static u32 efch_setup_mmio_addr(struct efch_cfg *cfg)
>> +{
>> +    /*
>> +     * On EFCH devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
>> +     * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
>> +     * region, it also enables the watchdog itself.
>> +     * If mmio is enbaled then the WDT needs to be started if not
>> +     * already started.
>> +     */
>> +    if (cfg->addr) {
>> +        if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
>> +              EFCH_PM_DECODEEN_WDT_TMREN)) {
>> +            efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN,
>> +                        0xff,
>> +                        EFCH_PM_DECODEEN_WDT_TMREN);
>> +        }
>> +    }
>> +
>> +    if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
>> +          EFCH_PM_DECODEEN_WDT_TMREN))
>> +        return 0;
>> +
>> +    return EFCH_PM_WDT_ADDR;
>> +}
>> +
>> +/*
>> + * Return SMBus controller's alternate MMIO address on success and 0 on
>> + * error.
>> + *
>> + * The alternate SMBus MMIO address is necessary if the address
>> + * returned from efch_setup_mmio_addr() is unreadable or the space
>> + * reservation fails.
>> + */
>> +static u32 efch_setup_alt_mmio_addr(struct efch_cfg *cfg)
>> +{
>> +    if (!(efch_read_pm_reg8(cfg, EFCH_PM_ISACONTROL) &
>> +          EFCH_PM_ISACONTROL_MMIOEN))
>> +        return 0;
>> +
>> +    return EFCH_PM_ACPI_MMIO_ADDR + EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>> +}
>> +
>> +static int sp5100_region_setup(struct device *dev, struct efch_cfg *cfg)
>> +{
>> +    if (efch_use_mmio()) {
>> +        struct resource *res;
>> +        void __iomem *addr;
>> +
>> +        res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
>> +                     EFCH_PM_ACPI_MMIO_PM_SIZE,
>> +                     "sp5100_tco");
>> +        if (!res) {
>> +            dev_err(dev,
>> +                "SMB base address memory region 0x%x already in use.\n",
>> +                EFCH_PM_ACPI_MMIO_PM_ADDR);
>> +            return -EBUSY;
>> +        }
>> +
>> +        addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
>> +                   EFCH_PM_ACPI_MMIO_PM_SIZE);
>> +        if (!addr) {
>> +            release_resource(res);
>> +            dev_err(dev, "SMB base address mapping failed.\n");
>> +            return -ENOMEM;
>> +        }
>> +
>> +        cfg->res = res;
>> +        cfg->addr = addr;
>> +        return 0;
>> +    }
>> +
>> +    /* Request the IO ports used by this driver */
>> +    if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
>> +                  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
>> +        dev_err(dev, "I/O address 0x%04x already in use\n",
>> +            SP5100_IO_PM_INDEX_REG);
>> +        return -EBUSY;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void sp5100_region_release(struct efch_cfg *cfg)
>> +{
>> +    if (!cfg->addr) {
>> +        release_region(SP5100_IO_PM_INDEX_REG,
>> +                   SP5100_PM_IOPORTS_SIZE);
>> +        return;
>> +    }
>> +
>> +    iounmap(cfg->addr);
>> +    release_resource(cfg->res);
>> +}
>> +
>> +static void tco_timer_enable(struct sp5100_tco *tco, struct efch_cfg 
>> *cfg)
>>   {
>>       u32 val;
>> @@ -197,9 +326,9 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>>           break;
>>       case efch:
>>           /* Set the Watchdog timer resolution to 1 sec and enable */
>> -        sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
>> -                      ~EFCH_PM_WATCHDOG_DISABLE,
>> -                      EFCH_PM_DECODEEN_SECOND_RES);
>> +        efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN3,
>> +                    ~EFCH_PM_WATCHDOG_DISABLE,
>> +                    EFCH_PM_DECODEEN_SECOND_RES);
>>           break;
>>       }
>>   }
>> @@ -219,17 +348,14 @@ static int sp5100_tco_setupdevice(struct device 
>> *dev,
>>                     struct watchdog_device *wdd)
>>   {
>>       struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
>> +    struct efch_cfg cfg = {0};
>>       const char *dev_name;
>> -    u32 mmio_addr = 0, val;
>> +    u32 mmio_addr, val;
>>       int ret;
>> -    /* Request the IO ports used by this driver */
>> -    if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
>> -                  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
>> -        dev_err(dev, "I/O address 0x%04x already in use\n",
>> -            SP5100_IO_PM_INDEX_REG);
>> -        return -EBUSY;
>> -    }
>> +    ret = sp5100_region_setup(dev, &cfg);
>> +    if (ret)
>> +        return ret;
>>       /*
>>        * Determine type of southbridge chipset.
>> @@ -247,21 +373,7 @@ static int sp5100_tco_setupdevice(struct device 
>> *dev,
>>           break;
>>       case efch:
>>           dev_name = SB800_DEVNAME;
>> -        /*
>> -         * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
>> -         * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
>> -         * region, it also enables the watchdog itself.
>> -         */
>> -        if (boot_cpu_data.x86 == 0x17) {
>> -            val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>> -            if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
>> -                sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
>> -                              EFCH_PM_DECODEEN_WDT_TMREN);
>> -            }
>> -        }
>> -        val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>> -        if (val & EFCH_PM_DECODEEN_WDT_TMREN)
>> -            mmio_addr = EFCH_PM_WDT_ADDR;
>> +        mmio_addr = efch_setup_mmio_addr(&cfg);
>>           break;
>>       default:
>>           return -ENODEV;
>> @@ -307,13 +419,11 @@ static int sp5100_tco_setupdevice(struct device 
>> *dev,
>>               mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>>               break;
>>           case efch:
>> -            val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
>> -            if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
>> +            mmio_addr = efch_setup_alt_mmio_addr(&cfg);
>> +            if (!mmio_addr) {
>>                   ret = -ENODEV;
>>                   goto unreg_region;
>>               }
>> -            mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
>> -                    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>>               break;
>>           }
>>           dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
>> @@ -338,7 +448,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>       dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", 
>> mmio_addr);
>>       /* Setup the watchdog timer */
>> -    tco_timer_enable(tco);
>> +    tco_timer_enable(tco, &cfg);
>>       val = readl(SP5100_WDT_CONTROL(tco->tcobase));
>>       if (val & SP5100_WDT_DISABLED) {
>> @@ -366,12 +476,8 @@ static int sp5100_tco_setupdevice(struct device 
>> *dev,
>>        */
>>       tco_timer_stop(wdd);
>> -    release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
>> -
>> -    return 0;
>> -
>>   unreg_region:
>> -    release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
>> +    sp5100_region_release(&cfg);
>>       return ret;
>>   }
>> diff --git a/drivers/watchdog/sp5100_tco.h 
>> b/drivers/watchdog/sp5100_tco.h
>> index adf015aa4126..2df8f8b2c55b 100644
>> --- a/drivers/watchdog/sp5100_tco.h
>> +++ b/drivers/watchdog/sp5100_tco.h
>> @@ -83,3 +83,8 @@
>>   #define EFCH_PM_ACPI_MMIO_ADDR        0xfed80000
>>   #define EFCH_PM_ACPI_MMIO_WDT_OFFSET    0x00000b00
>> +#define EFCH_PM_ACPI_MMIO_PM_OFFSET    0x00000300
>> +
>> +#define EFCH_PM_ACPI_MMIO_PM_ADDR    (EFCH_PM_ACPI_MMIO_ADDR +    \
>> +                     EFCH_PM_ACPI_MMIO_PM_OFFSET)
>> +#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
>>
> 
