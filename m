Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D615C74E7B4
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jul 2023 09:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjGKHKH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jul 2023 03:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjGKHKF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jul 2023 03:10:05 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B38DCE
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 00:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1oe8Sv+yCyIB/JUkvbkH12zFJhqr7FsU+VzX20qeeb7y0jQkUZnhlUy6dGPMAA2tuos06Yk+kdQkp32JRC2xbwgv2NKdO+S3FWzpf8MTTcFSQh9cQFWJe6QTjNhALmGJEtSBe+WyEZXJHSBeSji304I9nuabZ5VbOo7SNxxUCkErt7eAqbZPOWlUtBvy3RNxDDJdLwAobyuaUQV8bA8phQSTExjr2XbGLEUTAMPuoEUrSjX98b3X4cTJNo/uEv1cRJrNlwjDPgEjK+drQR7UwkyReJVWIEBzWED24JK5fNs0RAApSPu8Iq1KKvO3zUDfoIDfY9hXQ8m0VoMGM69vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dQsp+ZIwuKcFw7uUTc4czxHIkFZTZJDe4E9KWm9hJI=;
 b=TiVk5RVM7MmOghFyHbYLWEPAwBlrCVVDqzwMhESzeqNAmoEfpDGPJ8iIfX9WPyk7j3iry1S98n9yfJbgcQLrCPsfbL1p4vaTzpSjaaoQIuGaBckMchACwCcJLlLDVJJHqocJrGEVINvdePvrcYTES/rgVyZr/nXdjmz1nWv/Nq5zrur0DtyFCgeUeMGRNp4geUNNtpuVAO8UVQRT6VNPXaul2hwJjJ9xQQKsDUaNJuNMDtbDMfgvVrIcEnaPGoe72ssr7UzrFHIde6tXMuDhQpR21Vap9JeZt+A2SJAOMW2xz5pZPygmPl7uDyec9lBmc/iMK5/T7lpzhUq2y+aAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dQsp+ZIwuKcFw7uUTc4czxHIkFZTZJDe4E9KWm9hJI=;
 b=RNl6LakgKW8IQe6U6X6kOek17k4eUYe+osa1suEG9nhlrJL9x9Ier4iofWQQnDShaPTWVu+8ojL7HlboHfRrINIOIr22ShsFjdOQUtAVIEPwhjruVYFJaaOqkQNtsKfwFqUUqnmS4Tq2h095WeLwZYV8qSsamGdnHxaXZFceSYaRcjFIAKV4GtkH2RRj76LUXJ4XRKDQtfkcAtWiy9a+G3JgkGeTvC3q8GfsW0l4WKwrK1UUUAVfCH9p1pt6R31zjHx1/1sFJKtH81DVJFimaRDSwreom1LLU7b/cX21HCQdBEWnqwU7LFY4kPe7QfnRHwRnKBXYlGuJV9iATD74oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS5PR10MB8148.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:678::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 07:10:01 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f964:e0e9:199:9246]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f964:e0e9:199:9246%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 07:10:01 +0000
Message-ID: <e9c2d0a5-9618-b616-3be3-826cc0665388@siemens.com>
Date:   Tue, 11 Jul 2023 09:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] watchdog: iTCO_wdt: No need to stop the timer in probe
Content-Language: en-US
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Malin Jonsson <malin.jonsson@ericsson.com>, john.jacques@intel.com,
        linux-watchdog@vger.kernel.org
References: <20210921102900.61586-1-mika.westerberg@linux.intel.com>
 <251a6e29-4ba1-73ed-d714-f35a2d3ee4b3@siemens.com>
In-Reply-To: <251a6e29-4ba1-73ed-d714-f35a2d3ee4b3@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS5PR10MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: d89b299d-1e14-4952-443f-08db81ddd79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRn+KXzhGQBB6XLLj5wNvBc04U/YA3HI+DB4t0vSeRooSxaf30ZRGQzj8KSHFPhb08YW4Xcida1uWczSh4sBYrz+yYE0CZ0QMuW0vAQr3iWXxuLnokkFtk4lt9ZyNAFTUZgO0hzG4ENzBFnA7HCMq8t7N//a/cJTJNKhXCoHY/8IzTfJ1hOZvQuhDFBkSJbsYFt+4GYwcXEfsicTWkd+xyyBmn3xB6Dmmf0lmxa/MlgyF/iAXO/XMBJETk0yOtUY/7ttyS9egwFRnmzGuNh2xMPmX9MLHR647m4x+8K5X5YFDFGWVIKId7rAPJPbEPWPk+gFSIWIp2gCsrYDBKVoWIqJ543ZlQkzEMJp41lDHhCzQK26oVP8ueeBqkZMoaZEAOjLnkKXLPyp+luyFEYP9ZAZ+yaL9LjzjmkmIJ0KJ9nOJLOBv34yltH0zwOQVf3aCP44YCDqmBhDiaDCyXaNguMDJ0PGsngislVb6TxONvUIeTUV1Je5xxK+fmfeCYqfXcWASxmnYjAOBV0eBHcwtyyvO1oZqwHKCwAd/g0PDANUej0hxj98JKb4bqgdf+c4AHIVM+WO5CrsnaFsLYRfxkWiKXIGmGkM1XXmeOXQQsBPjvDczhKYzRce4M0agUO9pReoGil9Ln0wctpnbJ1Xvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(6666004)(5660300002)(44832011)(31686004)(6486002)(8676002)(2906002)(8936002)(478600001)(41300700001)(966005)(83380400001)(31696002)(86362001)(316002)(2616005)(66946007)(66556008)(66476007)(82960400001)(38100700002)(4326008)(6506007)(6512007)(26005)(53546011)(36756003)(110136005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDF4RGxFbVR5MW1vRkxYWnJwZXJtUXMwNFQrc0xFZ0ZaSElmQ1VCMzJ0WXZI?=
 =?utf-8?B?YmxNNFpMbDhoRkViUTlkLzRaejBLcXNJR2Y2YXl4U0lZVGFRNyt1N2xmVEZy?=
 =?utf-8?B?YUV1anlUNWxnbkd2dFZTS2MrcVl1a1NwdEkxbmdlL1dRaEZWR2xWTE9sckpV?=
 =?utf-8?B?bHRlcXl6NU5nQ0VSblVLYXUrNWkraFZQdy9IODJBRW1EWU1sN3prMG9qOXQ1?=
 =?utf-8?B?cmJxYTBUWUxYc3dSSTJkYmtVdTFoYlNoRE1DZzZMQk9VMkdoVm5VYyt1eXN1?=
 =?utf-8?B?TTI3N1lSVWtOMkwyTmN1Y2xKWFMxUWxkK2R4RGU3S2JCeDd5RHdjak1md3Iw?=
 =?utf-8?B?dlV4dkxKNkxVU2d1cjMzUEFWcW1UMEpaMDQzRVFKZVFWTk5WTiticFhQMDdD?=
 =?utf-8?B?dmNYZlZNYkJsWkk4bmZpNzkrK2ptdTdBRFRoU3JYc1RUM2E0MU5lTnhDQlJO?=
 =?utf-8?B?QWx1RTRKbUJ3WjJ0ajl4RWFJMjg4cTkxd1NQQWxYa3hSUlZCK2ViYitNSjEz?=
 =?utf-8?B?eDFwZmtBVHI3Nnc1OWJxRnlTdHpUWm1mZWJDZ29xOG1BWEVOdTFOK3lmZmRL?=
 =?utf-8?B?c3E1a1RDR21YakkwN05OYzlsTW1rNGZJUzRYMFdrZ0dUVGpwUkVtaVYrdUZ6?=
 =?utf-8?B?VTdnSG1kQ0Y0d1ZoRGZPZmptMldVL212UUYyTXgremQ3QVNaRHp5ZFluNFVi?=
 =?utf-8?B?YmRFMmVteDQrV1R4cWRydTZWY0hpa09ZYVNjN2s2Rm4yMjZSSllMY0ovaXBh?=
 =?utf-8?B?VGtsb3FiN1cwcW8vOHZ4ZTlyMjE5c3Y2QktSZnUybkkvSWpzZUNQa3VndjQx?=
 =?utf-8?B?a0kveTBGRzJIQ01QaERwZHEwZ1J2NEVLQlVGZmtqSk9saUxLUFJCbXBUZFlO?=
 =?utf-8?B?V3BVTVZTU2R1bHdOS0NPeTFaN2xSWFFTYzJYVDRaWFN6UC9zQXhzTlJ6ZUNu?=
 =?utf-8?B?cmlEbnQ5d0paVEJpMXNOb3pBQ3lGZFd4Q2NhdUdKeFZMWStKcnZVdFI0a0JL?=
 =?utf-8?B?emlTU0JvQkVoR0NZMHpxNHVxdkEyNlpSLzdIeHJ0K2p0R0xVMityL1BFNThN?=
 =?utf-8?B?S1lGMjQ1RWloZkRiUnpLemdFNVFXT0hMelFtOWJzWUY4QjRnY2VJVFZFS2RU?=
 =?utf-8?B?MEpoajkyVzQwTFEyQXZHWDBLT3lIVnhkN2R4VUlDbFZSanE0VTl5M1l2WW9p?=
 =?utf-8?B?MnZmSDROT1dwUkx3ZEpYYU1ScWdYMkV2K1cwYUJ1TEJVSHpOR1dwclRkTVQ0?=
 =?utf-8?B?SE14TXFTTW41dUcyalh1KzhyVmpDQzd5SmxkTTREbmxENTJmbk5jcFNWT3pn?=
 =?utf-8?B?ZlpvOUptU1dEbUZ0cVhJNENOc2J3ODVaODgvYVd4WXEzNW5pZ2ttb0tibjJC?=
 =?utf-8?B?QUZvZlQ1OFNIUXdCOVFiV1ZxZ1VmYWM4UTBFVjFnOFBuYzNUOFZtNFY1OW5C?=
 =?utf-8?B?bER3SG4yTjByVnZmZEpjN1FMdXd2dnZWQ00xZWpKeEE3NWJWa3p0M3pJR1M2?=
 =?utf-8?B?VjBlaTJUOGhsSE1kcmJvZFZsZ3JNbitoeTJmRFF6ekNjOWJlb1ZQaFJiVGJQ?=
 =?utf-8?B?TXVuUXB5ZFhPTW9RaHptMktjcHFBWm5ZdDM2SytKTDlmUDIxQ0VXdTV4WUYw?=
 =?utf-8?B?aC9ZRUhqbkFHNG5IOXZJdGVQdGY4TkFoTXh1QjJMdDQydkd3akZMVjZpcnZD?=
 =?utf-8?B?MmlBTTBWWE9qdUNlZERmWnJCK0h3ZjJrL2I1a1lOODRQaXozaWU3K0lwY0FB?=
 =?utf-8?B?YjJQWkk3cnRpUHdhM0NYc2lManhxZmZMZVZzSUVIc2duOFVhSzNTYTA4SUV6?=
 =?utf-8?B?SmM5SWNVQUh3SW5RM3ZYenRhVDRRMlYvdnRSZ3JlU0x2M3lZRUxMYndwUW5x?=
 =?utf-8?B?ZkExOGY0cU42SWFrSm5tb2hSQlAwTVh6cTE5QnhDUXd4YkVmN1I2SnVrckR1?=
 =?utf-8?B?ZWlVcjlFK3dyV0o0SHljaUZHTkp1TE1uTC9VVWRzTFJJeGJXTGxMTUZjdllp?=
 =?utf-8?B?ajFNM2dvQjV6SjkvU01VTVN5U3ltanJ5NCs1dmU0V1FNQ0ttU08rdTVIdGVj?=
 =?utf-8?B?RUMrSjc2b1ZBam0wNllHOUFDakVzYzNHUloycVlSUjF2UG9iclZOQVJRbTFa?=
 =?utf-8?B?R3NnUm5mN0o2SUNsdVVlUTEwck52ZGNKL1p3SnBjRW5HK2lBVWFSZjJFK1JU?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89b299d-1e14-4952-443f-08db81ddd79e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 07:10:00.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIXkxOn/boxTh8iIhWT9FKPj0H+wEIealmEtNVLhmANVKgpdrQVNCTdhOdsZIUqJtehg1vdoxrQ9nqq81KbSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8148
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05.07.23 13:22, Jan Kiszka wrote:
> On 21.09.21 12:29, Mika Westerberg wrote:
>> The watchdog core can handle pinging of the watchdog before userspace
>> opens the device. For this reason instead of stopping the timer, just
>> mark it as running and let the watchdog core take care of it.
>>
>> Cc: Malin Jonsson <malin.jonsson@ericsson.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> ---
>> Changes from v1:
>>
>>  - Only set the WDOG_HW_RUNNING flag.
>>
>>  drivers/watchdog/iTCO_wdt.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>> index 643c6c2d0b72..a0e8ad3901a4 100644
>> --- a/drivers/watchdog/iTCO_wdt.c
>> +++ b/drivers/watchdog/iTCO_wdt.c
>> @@ -430,6 +430,16 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
>>  	return time_left;
>>  }
>>  
>> +static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
>> +{
>> +	u16 val;
>> +
>> +	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
>> +	val = inw(TCO1_CNT(p));
>> +	if (!(val & BIT(11)))
>> +		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
>> +}
>> +
>>  /*
>>   *	Kernel Interfaces
>>   */
>> @@ -572,8 +582,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>>  	watchdog_set_drvdata(&p->wddev, p);
>>  	platform_set_drvdata(pdev, p);
>>  
>> -	/* Make sure the watchdog is not running */
>> -	iTCO_wdt_stop(&p->wddev);
>> +	iTCO_wdt_set_running(p);
>>  
>>  	/* Check that the heartbeat value is within it's range;
>>  	   if not reset to the default */
> 
> This turned out to be not just a cleanup, it's a fix for
> watchdog.handle_boot_enabled=0 as well. The issue is subtle, but this
> fix is critical when trying to establish monitoring for unattended early
> boot (OTA update scenarios). Can we still get this into stable trees,
> along with [1] then? I've tested these two over 5.10 so far, can look
> into older ones as well.
> 
> Jan
> 
> [1]
> https://patchwork.kernel.org/project/linux-watchdog/patch/20221028062750.45451-1-mika.westerberg@linux.intel.com/
> 

Any opinions about this?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

