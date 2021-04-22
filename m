Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674E13684CE
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 18:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbhDVQ3G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 12:29:06 -0400
Received: from mail-eopbgr40077.outbound.protection.outlook.com ([40.107.4.77]:28225
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236236AbhDVQ3A (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 12:29:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFYYpSBbtSgLVdyo2uy+TCLnASJnK5KRgdbZsqVnUfFOWD4rku83/qyVFnsNUgR6pQDgVQuVv4p7OphGhJgqBsIiMU5gg3n/0r1elzpwu5DFjYpuGpWlFHXvG029NzCaqo6aH1sUisHY1oFSy2nKN9loHuIut1zHm9/N/9YAnEApn3bnewiqJByT09HYqr8bFPF4CehiMN3JZClXO2OdJO7wvrmrhBbJpNFTmr9PUQiEInYPUDgwJ70W5peqOLEaNUnl3gFpQkgRT8rtphHziQ01nb2OoH5vb6pXcHCx8ihVTiLPwssZ/IzWn8GLRNLEDayjSpQtUPQXOJ6WJn5Ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuodW1vifscfHn0aoKde1pLfMR+536/hpaY+0TrNnBA=;
 b=LE+iiFCYPsKB42K//WGhtAvBZYNAdyNj0FwO8yFZopM8+AA7VpydKWV58lonzBMQ5yvcxGdLk3XjFVGFff1MuxjUUMAuXGlZZXwQO3HPwLv35bTA0b4sG8UU8po0cfNgGcD0qvJ1ElspxXUwQL6AqVlqzKJ1csTaLw3KRc9MBlq8N33sm8kQst8TTJyw60jbFU4LmwqC6rFp/1/ev5e6LhIfr4UyqVGVgAgE5+v+OUh5ZXIbH70QHgCgMmeYVWCORYwThyLagVYdJi48iMywUWT5tb78gt04Gt+ZHZuwjAJWUbvDLDeHzZB73XWorkbPLtwxnfBIutHJ6cHjdVhdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuodW1vifscfHn0aoKde1pLfMR+536/hpaY+0TrNnBA=;
 b=XJgpTU7Xd55lLZN5XZELL6nBmaAhZBD77Yfw989or8FmObIo700gU/LfzLusXAFyra8FIqLDIeSR4y2UGq76vzU85+alrjZMLAL2eMPjH+2BaaeoU0VbK5iETsn8EkPUDSW2WiQ+Plza38lO/8o+RVRUaiwagQxrlCMvmyMREI0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM6PR08MB3718.eurprd08.prod.outlook.com (2603:10a6:20b:81::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 22 Apr
 2021 16:28:23 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.020; Thu, 22 Apr 2021
 16:28:23 +0000
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: gpio-wdt: add "start-at-boot"
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-2-francesco.zanella@vimar.com>
 <20210421163748.GA110463@roeck-us.net>
From:   Francesco Zanella <francesco.zanella@vimar.com>
Message-ID: <49dc0cc4-c86b-3e47-f366-009406bc68a6@vimar.com>
Date:   Thu, 22 Apr 2021 18:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210421163748.GA110463@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: MR2P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::20) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.150] (151.71.13.13) by MR2P264CA0128.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 16:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 924d6800-82fe-4819-e174-08d905aba623
X-MS-TrafficTypeDiagnostic: AM6PR08MB3718:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3718F251D49C3AC0766F3515E9469@AM6PR08MB3718.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tzb1fD5w1T3UuUoc8/fARSKHKIANRg0GK9K5Eu8OZJHBgrrnRbYFTaLvGVWvZ8J1Jh4HNXDXhhz+dqB4J0luCG0mPK/FQcGbIxj2wXUN7UPlpW9vJ5tdiRoeK4sEt3vEgzvI2ekOlAy5c2XBIF8mcJieCKnspgCrGg/AvAkBeSSEUCQWiN32U8ey/Jdr4/bMxAA350I+MtqKzvZP3CK32T2uwvInyJ3KrpN6EAeC+xb/NoVCmFx0G21eDfdJeV2gJf7abOkYYVHSiG6zcm+seeMhZajRQwxnZeceEH2fFNfwi4K5NLiTWXfrTy9URvFz3i9lIiQAG0yeKonU+QMb/0O2psJaaZojVZCulhORo6GJCXBj37sZht3nx1efSYfWoiHu1vEogqzp6ildsu/QxMwnQJJnnX1UYRutR0yB5KpZMnRTrBPJWgS74lYR4T60d2uhNofmM/hg3muX4MPaB1Z4Rv6deHH2BGBg7fRBq53V9JL5al5oABc41LvqqcY2HlKvjoRwrVSsrZbWYWlpHyPpgE5eBHAomKlox0QrH50LuQCQXj3QMQ1th747StPxzh06HTHHev5mZ2mblkZ8wHRlOqr3BXCc1V7RC2ZMN6ptIWvC5B278Dy10R8bQMkuwk+nS1JYuGRwntwze+Pq1CcUbIukyctZe9bUtI8YnCO/tlgn5Hr/uvLkmrds7fQR00ohbCZcG7+MLzF+EXW044wdXIw3DJiLhI3p2ElQw9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(136003)(376002)(346002)(366004)(8676002)(66946007)(186003)(8936002)(16526019)(44832011)(38350700002)(6666004)(478600001)(316002)(86362001)(66556008)(66476007)(26005)(6916009)(31686004)(2616005)(83380400001)(6486002)(53546011)(31696002)(4326008)(52116002)(16576012)(36756003)(2906002)(5660300002)(956004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dU85TGUvTjVDQWx2VzJSMU5SNE4vanRoSWl1VTdaOXc5cFEwWHdnMFZheTVV?=
 =?utf-8?B?VC9xMDJnV0ROYVY1RjQyVXMzbVVnVGd6WUJiSXRlYU1vaURMWnlkZENDNVBX?=
 =?utf-8?B?Y0xBZ1B4MXVkdFd5UTU5YmtqT0JlVHZPNklNTmNoYWt3TjhjdUxCazQ4Z2ox?=
 =?utf-8?B?WEphakk3VHVEb25ROGVET0xrL05MdzdJTWFWcVZXM29QbEhsREdOT2ZlRkNy?=
 =?utf-8?B?aEthNEdvaFlBbmM1QklPU0dObUdPVHpvRE9oVHlxWkJmUGZSbU5Fc0tacXF2?=
 =?utf-8?B?RkNxUkhPeUM2YmhjNk1pNHhudnM5aVRMSndrWVEya0xYM2VJS0Fvcm9ZNjBm?=
 =?utf-8?B?WFVhK3M0aDJtbDcwR0pPN0xXNEk1RzhBWlFLc20veHc0cXpVOU16UzNzeWZl?=
 =?utf-8?B?V2xzODB5LzBnOTNOUFVaYmY1d001RldlejZKYTBZVGF1Vko0SkpZN0tGT1Jp?=
 =?utf-8?B?c2VQTnpOS1FWb0hoWTI1L3J6NzY5akNCU1NZVlE1a3VnQlFudDc3Q1VUNlJY?=
 =?utf-8?B?M01wU0prVlVNUElUQmZjZEVCUUcwZVNTcUU5bmZrWnlyeE8vb2pvc1RyelpR?=
 =?utf-8?B?WWpuUzEraW8ydzlBRndzNzh0cndJV3ArSmIxaHVkRTRWdURIL3IyU2FCWi9M?=
 =?utf-8?B?MnZsendreHB3TWtZd1JCR1Jyb2U3T0FSQlV4bWVOZG1lY1pyN1R0YzI3UjN2?=
 =?utf-8?B?QndPSVdiOWx1SXZtVHV2V1BSSUd0THlMWS82Ylk1R0VTODZVQ1FOTXE3eFd5?=
 =?utf-8?B?S3gxVmpVaGNVMCs1Mk52UklYZy9Ma2RMOEVYanNyVTZJanVlRjVDQWtFVWNC?=
 =?utf-8?B?bjFvc1RNNDltbkYwcFkrQmovQTV0Z2VSdDdtK0NDRm1yT0pkc3hNWDNxbFBF?=
 =?utf-8?B?ZzlpaFo5V1JBbUk1WFl3THl5dUJZUjUxV0Q2Y2hCdHYweGNnQ01wVm42RzdX?=
 =?utf-8?B?czNZU0lQdFpqSGRWUjRDVFMxZXJDaXkyUExtSS9OTjRlcU9WbGgzMnU0TmlP?=
 =?utf-8?B?cDhtSGUyc3l0TVk4TENOa2xJdlVpcFVuaHRPRUsvSTNYc3EzQ2xJVm9PdGcv?=
 =?utf-8?B?ODNQTHNHaVMrTXhTOW9QcWw0UWtldGZmSVUzU3hVNEROaW55VXBJTi9EaEtW?=
 =?utf-8?B?UTBCNElqVjVETmFuNXczYVAydmtiUkxzakRWY2R6N0x4R1pqK1N2eHlFaVNa?=
 =?utf-8?B?Z0FzZTR1TEpnVWlWbTRpd2ZsckpBOE5YSGd4WndjaHVxeklCMTlTdHdZU2tV?=
 =?utf-8?B?eHlmK0pNK3BVN1d3cGtNWWpORFJjNDFBOHFPRkpCTG40N25oaUhtTnFGQUpx?=
 =?utf-8?B?TmZUUFRFY2JtT1NkZ0s0aDhNc3pqT3pDNzF2Qk1lNldEbmNqbEcyRlJ3VGg5?=
 =?utf-8?B?YUE4Y0IwY00yWHdCaHNlRERYbFBmRDRtMXlZVFpwcHRJNnQ4djFhV1lsL01k?=
 =?utf-8?B?a2M3TnExSmU1aWpYdzRnVnhOeU1jODJia0w0b0p4b0FwTU03UEwzV3pOczRQ?=
 =?utf-8?B?eFNOcHFhdXZIbTdTZHhBUTBkRDVpRm9MVW5rTXlWRzQyY1o5RFN4NExrSHJl?=
 =?utf-8?B?SmZ0dUtxd0FuKzhIdjNyRm9FZnNZSmZwOXJURGhLM0c4aUlXb2U2VDUxakl2?=
 =?utf-8?B?SldkeGhUV2hoNno4bDB0OEM2V21OWTIvVkhDYWdTa0EwZG5KSVdndlMrWTdT?=
 =?utf-8?B?ekgwaG5ZZFlDNGo5MXZUenliZng0OXRMajQ2S2VCYTNqK0Fra2puaCsyeGtx?=
 =?utf-8?Q?AJaG+iOOxHBiO8otD4KYHr5D9hgjf6FfzzTNFd8?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d6800-82fe-4819-e174-08d905aba623
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:28:23.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTajzLX0JHB4/+m/enAx9DroMvb2xHVD3jy6Mg3fc8UIdMi+rY8B1Uok+ZbJtVu+JGRQtQn7U0Ik7djwgDGAzugPiANmYpm2pfip+Fc4xhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3718
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 21/04/21 18:37, Guenter Roeck wrote:
> On Wed, Apr 21, 2021 at 06:26:20PM +0200, Francesco Zanella wrote:
>> Documentation for new device tree property "start-at-boot".
>>
>> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
>> ---
>>  Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>> index 198794963786..cdaf7f0602e8 100644
>> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>> @@ -17,6 +17,13 @@ Optional Properties:
>>  - always-running: If the watchdog timer cannot be disabled, add this flag to
>>    have the driver keep toggling the signal without a client. It will only cease
>>    to toggle the signal when the device is open and the timeout elapsed.
>> +- start-at-boot: Start pinging hw watchdog at probe, in order to take advantage
>> +  of kernel configs:
>> +  - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was been
>> +    enabled before the kernel (by uboot for example) and userspace doesn't take
>> +    control of /dev/watchdog in time;
>> +  - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
>> +    /dev/watchdog within the timeout.
> 
> You are not supposed to refer to Linux kernel details in devicetree
> bindings documents.
> 
> Guenter
> 
>>  
>>  Example:
>>  	watchdog: watchdog {
>> -- 
>> 2.17.1
>>

OK, I'm sorry. I will resend the patch series without kernel configs
references in documents.

Francesco
