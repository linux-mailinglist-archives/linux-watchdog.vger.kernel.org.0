Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC087482E0
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jul 2023 13:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjGELWl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jul 2023 07:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGELWk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jul 2023 07:22:40 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2057.outbound.protection.outlook.com [40.107.247.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03F111F
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Jul 2023 04:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv6x+GG9mrel34za0Qbt3IDcwJlAShhL63eRuvTix/wWXRFzkUoMVEBS3RYJaTbn8/y4AEnhee8whEjw4Hvwr+QvhxRgRjtCmBL47wDXnIXr442OaQmbwe0iXaRPBXOUR8c9k1xrL/Ut6QtUeLuxtdkcgnbWjYAWZJdoqktxKbdyrFKaIIKuQxbOXtSs6LtIbMydjva0LPYkUXWEMn82u3RToP4IpAP+AtwEQ1kCtfKu+Dm/UWQez9wWmRHMwqDrd0QahHH0sESh/+dLrwPrDonld8lwQ4IqtNJLzGVlE3Cdw4qV+zGid/8jiOWE9R4C0SeUiFL8ghLw/3LxIJb8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM/igGI5f0FL04DD/tAf2pGgC5bq3eDOEydJaGyKnuk=;
 b=HDvjYUH/PEVPPjTdNpeRsL43jnYQm8Vb+vAIgJYdpQv8suuE1hh6dUtrIT79HyEMVgeMw9XBe3iI50kwWDGp1Sa7fJnzNfo+4UQ5h2id2R3b/EWMujIUJ/JABrYZMb3o+7UQDm9ZarLy1aSJbjdgvJ6FKr4ZGMzeOhbHT0ARtofLS/WhABnhRtjlPn0roq/PrfeoWbdaH1D1cbPPqLFA2Fd+5eIVAmtmB7gsUyCeu6TrhBmq9txC2Ym9JRwaXzFQ3SvaFg93p8JW4D4YY+mQBXcrDOqZNvfBU9LMhg1/SiPfbFOb/EhIS/U6CF2IkDfXf4aUgmTP1SkuF+jL2yaIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM/igGI5f0FL04DD/tAf2pGgC5bq3eDOEydJaGyKnuk=;
 b=hpL3oRDJYyf7bGbNASdd1dNOvNkacAyXnXsLx3TS3AZR+L941WUx1AMRvdjIz31Wf/t11i7eNdYVVzR+qmuN6d8bUl6slshdZwH3jM55UBYJImWFUCc3bJmxI7SUyTLD/ke8qBIO4bKKMCSy7D2tyqVD/1jwxluKSvN0z2Hiu6eM0eaGGobz/VejNk1LVl8mnVmLoUEst8t4SA8Z+gpMfVi/fReLA8siQEBwcIAS1YJy0dr5ujT/0+0vD5tOmZ/QImLA/X42Ex2DSyCPpHZdx0gHA6+QYUwgj+3NvhtJLIkIcI2/tk8qalHMrBiUZ9x97EdVfNBz5xD8rHT3RLRckA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB7207.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:619::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:22:32 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::53c2:174a:8b13:ce94]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::53c2:174a:8b13:ce94%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 11:22:32 +0000
Message-ID: <251a6e29-4ba1-73ed-d714-f35a2d3ee4b3@siemens.com>
Date:   Wed, 5 Jul 2023 13:22:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] watchdog: iTCO_wdt: No need to stop the timer in probe
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Malin Jonsson <malin.jonsson@ericsson.com>, john.jacques@intel.com,
        linux-watchdog@vger.kernel.org
References: <20210921102900.61586-1-mika.westerberg@linux.intel.com>
Content-Language: en-US
From:   Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20210921102900.61586-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: f527ab63-4f98-4a6d-0dc2-08db7d4a2055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZcvvQcOPIo+yyQqr7khO2GZ8ioTPvQ0GH4sjYArZ88OTdLJ8ETbfqZCFwc+4ndOEVml4SjXzJ+SiFXkKHRZ20A4b0VB8WELpEZO5cpReaC3VuxB2gIKKkLtQ7lMkkUSXKgd2zDc5zQbER4BKqhhuEJ1tgVIxyTIb32n8NwsICI8MDv26sWU3ZBomblVApfvEZC6rgo5IH9BsVpr02+fEHes7w4W1/XMavvmbw/HLP/WYlv11J1Rq5LibA640MCvnegjbAO80IQlhPtfJ7MiwC+1BD/wIpn20L/U//O8qNPWrU9eVccs+HxrSwPvB5oUCqgu6G25JK9SLLD0kDBrLJg45+rTxME4QBTaNj9CcQ5opC3dAi+HyH9reX//iiKpRlN1ZRla3DYZZGj4mxD1IkiOQhdNBZnj2Gp0/5Bkln0AWGoDujx1+MSGA3aPva6RkptgqHba80iyHKfQqZAoS9GxvuvGGUfcTvVtUoRlnSfIzhd3R42AZZXNgngJ6tykE84giqL+8cdWUqzeKRkckLk934G4ifzmP1sGsjBJtnMsDF2pzDw2QBHMTu1E7YQ0V68p3BtLxKPipWa0y8zpYTBGOPNIWHll3jvSWr7wE3rV9REi6fnYZLNj8yM07WyDuxH8cZmDzbT/vB3vSbz+/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(82960400001)(2616005)(4326008)(66946007)(38100700002)(66556008)(66476007)(186003)(86362001)(478600001)(36756003)(31696002)(6666004)(6486002)(6512007)(966005)(6506007)(26005)(53546011)(110136005)(8936002)(8676002)(44832011)(5660300002)(31686004)(2906002)(41300700001)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJvMys0aTQxRlpJY1JzUFVJbWY5QXVSSm10NUNMbTRrZkJmRjQyZzRSUDBR?=
 =?utf-8?B?Wk5hUG56YmU5L3dVVm1sc3YxTWF6NWVKU3ZoNjRPMUFOZFk1Q3paVENLeTFz?=
 =?utf-8?B?dzR2Z003ZnREMEQvckFOYmNpUm9BZVIreGw1Y1FXTG1UUFNaclFXdmdheXFW?=
 =?utf-8?B?aW5lbVpINVpaOXM0V09FTW5YNEkwSXcrL1NsMjBleHQ5RllqL05SM3ltR21u?=
 =?utf-8?B?MGlqa0JMLzJTSFA1VjdDSkhUVEg3WFZaUEJYS09Obm56UWVXZ09RenFmbkRM?=
 =?utf-8?B?NjZSV0d6S1BMbmZRenc5RVdSb0ovbzgwZXBONE1wN0NNREM2ajBDWkUzalFK?=
 =?utf-8?B?OFRnVVlXcXFoUWM0bUwxRTZiVTNhcGJ0M0tNM2doQ0tWdFdDRVJMVFp6dmY3?=
 =?utf-8?B?aWxhbmwydXdNNUFlRTEyak5zZEN0bklsdHNSb3pDdUt1SnZ0OElMV1RrMmdJ?=
 =?utf-8?B?bXhsVVZNdDZYTUxtTHAzZk9zYlVHRUpmRkRZTmkyM0QvM09nNTFTaWs3VDFP?=
 =?utf-8?B?Tm94NTJXY0czVFl5c0x1THg3WUEveGJadVpOSklqUDlaN1ZOMWpMZnJETWxv?=
 =?utf-8?B?Qm5lTnNhQllWdHRIbEtTSFd3ajBKYXI4UGs3RWFMMjFuK1B2cWxSamtrZ1FE?=
 =?utf-8?B?T0tuUmMzL0gra1BVazdNY01CVElCQ1U0RlRaZEpsU3gxb0dtaEZNMFdMRmpa?=
 =?utf-8?B?NysyWjdJQ1ZSUFNqQTdVV2svN3MrTlk0bU5iQjV0ajNCUHhZYWJCZmFZTVBO?=
 =?utf-8?B?MGVLWStUWU5CazBXMUYxT1RCTG56Y1I2U25jaUZ4b012WnVoQmcwd2UwVU45?=
 =?utf-8?B?K2h2SlJWVjBGcTllQ0dCMVNNLy9Ea25JTFU1eTRmb0tJeUNPV3ZwQjhzeHF0?=
 =?utf-8?B?TDdybVRuUmVTTmt5L1pGbHpyUlJPK1NlYXk5eEdMMFM1UHFDOGNNUldBaCto?=
 =?utf-8?B?Vzl3TjhkR2poczVWY3BnODdlVmdzeHJBb1VZSERNL0hTcVNpSXpyYkM2U3Z3?=
 =?utf-8?B?RlErbTZsdTBGOWFtMzAybFJmMXBqaTFtZWJYaDdBaHhoTVVGenBob29pcktk?=
 =?utf-8?B?emhFY0dvNzVNUFB1RDIxTUR3TTNuZFRnZUpHNG16b0Q5TURQOHJ6TzNGbXBC?=
 =?utf-8?B?L1JKbUpoM1h6WXFJQWJ2dnZQcTRjbWxKWnE0Q3l0Umg3eUdoaStDQmMxOTBX?=
 =?utf-8?B?TVdkSUk3cFFPMVBCUlUrWmpZL1NqOStJZTRzT3lqOElEVVhKdVVoVjBWbkRi?=
 =?utf-8?B?RFoxQzUrRGlHOTBod1JCODFDdFJEZ0tPYzNuT2pQNndVT1oyZU1ha0laQzlT?=
 =?utf-8?B?dmFZZEVVcTROS3dhL3RYVTJaOThFTWpiYWpJR01PWjZ3c2tKcUhiWjlTUUxl?=
 =?utf-8?B?WUFJdEJpbDI5bFJhd3RtOGt6S2s4TWRMQVhWd0x0aDVlWnRxLzMrWTNDVEJ5?=
 =?utf-8?B?TnpZb0xBdXA4S1FoS0tXU0tHbG9iS2FWNkNjR2crVlJhaVpTTXA1ZS9OZ0Ft?=
 =?utf-8?B?Z1EwUksrREJoMDR1SXRDOTFEbHlreFVCUWF2MldNdWF6MWgxempkMkhkT056?=
 =?utf-8?B?ZVB0RW04Sk5YVUt4RXI4eGpUMURRcXlsOFZ3U2lmcGswY1NHVEJxa21SZmtW?=
 =?utf-8?B?YnFHTTNlOUY1Z3VFZzNKUS81QkVqNXViUFA4WC9ZZjZNRk1hSkpRanBQSzhL?=
 =?utf-8?B?NjVGcHlVV2hTZ0x0OGhJVVB4T0tVbDFpZnFzcXNuYlVjZUhmWFU5Y1RVbWRL?=
 =?utf-8?B?MHJ6Y1F4SUlRazVFbFQvNzBySTJiYVFQdklpMXZZU2FMUHhiMWNLU3l0c1l6?=
 =?utf-8?B?UXo5ekxWeU4vUThqUVNGY0wvNmErT0cyVk1vZWN2TG5Ha1JCaWMrazdiYjVk?=
 =?utf-8?B?WktwbG90eXZJcEZqalJxdE5ka2FKN1IxZzUwL2MzRmhjbW9mbE04Nmp6aWw3?=
 =?utf-8?B?clc2czdETmVPL0xoSlovVENuZUlSb1I2TExTazBUby9HYmFhT0FVdVFDYWxy?=
 =?utf-8?B?cnFHMXRnL1ExQVNIOGc3ZjJrYTRpdkNOM3hmODZmRWE2bEVPd29NRXJOancv?=
 =?utf-8?B?ZGxYUTBwbjVFclZoY0VjVzRZcXBEZW1rSGlXQk5Dd2ZwZVMxazcyb3ZEZFFI?=
 =?utf-8?B?Zk50MHhwbzIrTkxRL0FsUng3MDNkWWNRMWVFTGNyejRhOCtuMkdSV1FFb2Jp?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f527ab63-4f98-4a6d-0dc2-08db7d4a2055
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:22:32.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m93TsS9+5euUMkkkOzTABmg0e689dP3WyBYB2SL9OLtjHpV0oN6CPnKhApqKUTtremSY++EoAU2QX1gH1OEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7207
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21.09.21 12:29, Mika Westerberg wrote:
> The watchdog core can handle pinging of the watchdog before userspace
> opens the device. For this reason instead of stopping the timer, just
> mark it as running and let the watchdog core take care of it.
> 
> Cc: Malin Jonsson <malin.jonsson@ericsson.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes from v1:
> 
>  - Only set the WDOG_HW_RUNNING flag.
> 
>  drivers/watchdog/iTCO_wdt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..a0e8ad3901a4 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -430,6 +430,16 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
>  	return time_left;
>  }
>  
> +static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
> +{
> +	u16 val;
> +
> +	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
> +	val = inw(TCO1_CNT(p));
> +	if (!(val & BIT(11)))
> +		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
> +}
> +
>  /*
>   *	Kernel Interfaces
>   */
> @@ -572,8 +582,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(&p->wddev, p);
>  	platform_set_drvdata(pdev, p);
>  
> -	/* Make sure the watchdog is not running */
> -	iTCO_wdt_stop(&p->wddev);
> +	iTCO_wdt_set_running(p);
>  
>  	/* Check that the heartbeat value is within it's range;
>  	   if not reset to the default */

This turned out to be not just a cleanup, it's a fix for
watchdog.handle_boot_enabled=0 as well. The issue is subtle, but this
fix is critical when trying to establish monitoring for unattended early
boot (OTA update scenarios). Can we still get this into stable trees,
along with [1] then? I've tested these two over 5.10 so far, can look
into older ones as well.

Jan

[1]
https://patchwork.kernel.org/project/linux-watchdog/patch/20221028062750.45451-1-mika.westerberg@linux.intel.com/

-- 
Siemens AG, Technology
Competence Center Embedded Linux

