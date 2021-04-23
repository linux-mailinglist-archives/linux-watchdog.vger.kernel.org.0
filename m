Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D4836912C
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 13:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242153AbhDWLhD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 07:37:03 -0400
Received: from mail-db8eur05on2108.outbound.protection.outlook.com ([40.107.20.108]:51197
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242029AbhDWLhC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 07:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUm2jKt85uEmCPrYpr5xhpJf2nbTDd2B0TpJwf6ukpc/vZ1bF/AbTiGd0n3eNLk9URzQIlqToIQuO+49AA2nr49x2Xf8kNmP+ampO7WoHIPAOMV3SHDuYXbwanqJ1L4ZhaQgT4Pcs+qkf1hM0K1JgwEqeyLGOW3LYX3CluVmmufbsAE6XfJtIdR3wUqALkXcTVQWlbASUqCmun4ZFaye3Ar/qm81wWR2eDKEta5fqsfTdB5u1DQ+SCLVOiIdws5e8LE6UgbPnW/11bv6FN+dCLU+tLdU+NNva/3fVcJsCf/3BzNT37wPP19ZIX/zS2liPF9JoFbKX+nmejRDMFOGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4Pm0Y/LxXskvnCvIGdSWE1RZ3KAhyu8chOaYNa/yGU=;
 b=M7Uk1Hzc0JM4PThfmBv4IQDbRI6CSeF+0VSAUgOECQX0bHNt+isWeHtHXuO8PaMqn63Ku13LqEHY+iZAiHh670HnsZAqh07JHWVwerZKpESkgjRKw8FQE9jETKZ1r+KW90vh7+5c17cRbc7CS+x3svx0elj44ryJdLhskBxXOqE4QtSPXxV5UHuOE6KLFKQQva8UvsWkACod94PbMpJUQYq9XNHlVc9JHh0570k/R7W9lGVaL47AZB+cuv5Fq6yJc1G4+M8oXeVBab9wFIgWBcxEpZpv7lLcfUcPzhYzfa1JS9lKj5EDAkquoMj4chwETGEc9Z5Hd27z3+iLqJeeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4Pm0Y/LxXskvnCvIGdSWE1RZ3KAhyu8chOaYNa/yGU=;
 b=fBzPZwUxKVfet/i5sndq0CmO3slhw+pYjzKJnLoSOdId5oUuQdIM6oC3k+G8xk0m7hgzeRZUZRFXHXd6fttsO4BVO4tfwfemFK4lFeUtAW8AojiV5L8M7vLsWxxH3WAOQwRGzP75HONJzvSxTVqRnOxw/T5afTzxINrpD8ZWR9k=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB4132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 11:36:24 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::888d:190b:b3b5:1ad2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::888d:190b:b3b5:1ad2%3]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 11:36:24 +0000
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
To:     Francesco Zanella <francesco.zanella@vimar.com>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <95ee0e48-2214-618a-b351-ec8d4aaf0083@prevas.dk>
Date:   Fri, 23 Apr 2021 13:36:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210421162621.24910-3-francesco.zanella@vimar.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.208.71.248]
X-ClientProxiedBy: AM6P191CA0082.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::23) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.71.248) by AM6P191CA0082.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 11:36:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be9c1464-57b6-4cf7-0c08-08d9064c0632
X-MS-TrafficTypeDiagnostic: AM8PR10MB4132:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4132599F9B94337088E784C793459@AM8PR10MB4132.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObixLHlH1vEOYc/N8+meheLyGoZKkJ4i7B9P5WWTU/1zC4GaJC97+Bau3rR1HUsPmH/LcCl9V9eMyWJXZFXVhczJzrWU3Us09xvGgNg0zZ1d3U1Be3/H+NqAfKqTktdCr8ArOjXyyL9yzCj9NPAo5zm/AZwLBW9RwP7BITRnDZhoHJu3FgT+YmqStkuNqM6A0xgvg9PW1hzjNsQeK9xyVVyvDR0uiaRN+tDl00Hwki7BsRA625sOTtZ1WcnTr4Fvdz6nYltcFihnjuftHFLBhpdqIkGPwhcEEDjbJsIpOf/BqItPJIu232wsQa3aEBqEAFCASlWoUsOwTNBP1+j8gv68o54Ph5BohUaAMCJ0ysdmENVCs+HT9nX8OgLDMIoGIs63fBkhYSCt1fslGGPPcuYRyQ3dUaft7smSjF0lVUcupNOtM0V1l9ruFCKJCJLTzZCkfjPV2H+YDGTkeMQftH7qVM4gihtdnL+ExpfYwHc/Mmy4BO5ehRWK6SHlJwBzbilEGLaBrVnOTMb5C4/JFssWFrze4+8XPkUPk93QhDrhz51pPp9K6q1AOixMhrlTHDxP/bNojyfycyth3bWNBDb7yDlF8vv3FE65HT55bq8t4fkQ+d5150N29O23qXAgf2NLZoKWhSel+dXYM5Q/j+vSwh55P1zTQmxsLgFu4uzm8BJpsGITc3RznLtPmk2xq5X+SUZeuEJrEkx4mpIa1mR4PrLWVd58AMMGvSMxlfyxfE5DnTQpkxo/SK9DHo7ndSeOyFRiiDsB6LddNmB7eKA0ZlKEB+OpQCA0EVv5mCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(346002)(376002)(396003)(956004)(478600001)(2616005)(4326008)(66556008)(26005)(16526019)(186003)(44832011)(86362001)(16576012)(83380400001)(66476007)(4744005)(5660300002)(316002)(966005)(31696002)(66946007)(52116002)(38100700002)(2906002)(8676002)(8976002)(8936002)(31686004)(36756003)(38350700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?Q3qvz1BXHeaKYSnwW/LjGqUm4kVA6FXHO1meDheXYfVi4be4cKaaCbIE?=
 =?Windows-1252?Q?/c33hTtsuHtuBP0wLWvg75XFtvhjGJN0zozYDEKerB5Jkc7udjIi7BD3?=
 =?Windows-1252?Q?Z7Qip2T26r98KhbCo9d3mQSsbcBln4GmcU/K2IXKXFpz5zFhfNJk79qF?=
 =?Windows-1252?Q?t+GY4VxPyZO2mwdilZTZ0lbPmXK2zjTsWoLhKvDm5ccHg7dC/dNfH7Ni?=
 =?Windows-1252?Q?E3L/kglCIdoY13+xWXO28gyHqXAfTdO5X6EUOiuLOsfwHrIPpYd0VRqH?=
 =?Windows-1252?Q?x6Pd+Bd62ol/RgKxKTTAf0kZBK9xOh/bbRmNBwq6QzMeygTi1efmbYwZ?=
 =?Windows-1252?Q?8xBaPNJh0fPjCjo6UWSBBuoYt4wgPGtUmzDHBryP/z6JGRXTAx2e58aG?=
 =?Windows-1252?Q?ZC9Wtk9Xf0mDbjF/6mmQV6zzrW6HsTNdmfjPncvZwhKufz+yd3qm9xQd?=
 =?Windows-1252?Q?IBEkr6Ufg0JS9mY0D89OK0XABICO4OWd1MQyrNNwXskJFnabAD0m+b6f?=
 =?Windows-1252?Q?jRRpBlhHeLtiEJLFNdSUkeJIP06+14i3pEMWMtv6MlISdXyPJ/XSQHNC?=
 =?Windows-1252?Q?gz5ia6i+7/jEbz4oGW1JZGgMzwrC6jyHmsa4KGwYqlGU0Tq6LZemRzfV?=
 =?Windows-1252?Q?nw82fAtUcCvBAbF4iXcVNWoFMgXpW+wBOID2Pjz01uoq3TXMUUeeC7gD?=
 =?Windows-1252?Q?gLilqTBfaDjNVynSt0VYBsk9GyCpXaoxeEq9b4pBfyohqV27StDhYXkh?=
 =?Windows-1252?Q?Bq1t8Xe0L5WcnvcDycM6UD+mTOzuUXzlcQhvHttVTbNO++NMiYpAdy6C?=
 =?Windows-1252?Q?+IpUN5AJna9rjpriq+stauU148TO341KUhMZImN23jnag7ukIpuV/w07?=
 =?Windows-1252?Q?FZ+SRYM+O9N5ShzZaDAhJanXrQQY0vdvhTnEZn2n0haljAeq4kPM08iB?=
 =?Windows-1252?Q?VVPxVZYFo9OzZH8ilV9WodNBcqOej4BnNQm3+taZpAFKyOoN+nVjLlUo?=
 =?Windows-1252?Q?ui65BV50UiYbQThO3w0I3ZhBQnbZ4B4XTNa48Zcb+1RykqFMdoq0WppV?=
 =?Windows-1252?Q?EyY4GSdIQXiKMp6aekylMYZs74N0J4ilF1eC9pKR3PK5np0bX/0owuBc?=
 =?Windows-1252?Q?8L/EUF3eXaDxo/8uSQ32IKzGuBobzYnhTY3IiUmCB5jHoIfXVjCdoP/F?=
 =?Windows-1252?Q?QPUH9CvJbxJwaTWBDl38YF++Ct7PNpsHAUsMgR1lHzgQDvPBnyutwl3K?=
 =?Windows-1252?Q?DWxzwSG8fHMzm5Q/zMKH8h/dEw3QBPtk/Bxzr/wqt8rwfFmW5RCAzLR7?=
 =?Windows-1252?Q?HvEmm3dXGDswbQQBd6kKBP3GtAQmL6+Zvaf8s6iX6Ir3FXbi+NDR57XB?=
 =?Windows-1252?Q?oaX0+VxTVMlGgE8BEoDlFuZTtb63O1Ke83C1ddBIp2zGBgwKKmpkgXte?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: be9c1464-57b6-4cf7-0c08-08d9064c0632
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 11:36:24.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zfMDpDnv5SOl/yaeg59zXpIYRo8leDhwg7wPm2jyScwt8XRBufSPCTSVnhC1SADzhF3Y/qylugZIMC1Jq8x3c9ssLE3W333IK/iucD3AUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4132
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/04/2021 18.26, Francesco Zanella wrote:
> If "start-at-boot" property is present in the device tree, start pinging
> hw watchdog at probe, in order to take advantage of kernel configs:

(1) Are you aware of the recent proposal to add a similar feature on
watchdog core level:

https://lore.kernel.org/lkml/?q=start_enable

(2) If you set always-running but not nowayout you essentially have what
you want now: If userspace opens the device [within the limit set by
OPEN_TIMEOUT if that is in effect], but then does a graceful close (i.e.
writes 'V' immediately before close()), the kernel will assume
responsibility for pinging the device. So the device isn't stopped as
such, but if you can't trust the kernel thread/timer to keep it alive,
the system is already mostly unusable. [Also, how reliable is that 'the
timer is stopped if the gpio is set to be an input' anyway].

Rasmus
