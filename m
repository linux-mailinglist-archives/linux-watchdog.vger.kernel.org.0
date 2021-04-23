Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CA3369490
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 16:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241036AbhDWOZP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 10:25:15 -0400
Received: from mail-eopbgr150073.outbound.protection.outlook.com ([40.107.15.73]:48453
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230520AbhDWOZO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 10:25:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8KdPtw9gfOeCTl7jWmIQHDRpIaUFD5XzpKsbqakUBrnu8Gb4MFD6WHGJHoKfLKqQwyv7A57LhhWV57grtjbkBl0imHJi+ibL1JfBlnJa0/1Yi+EKVlgymsQ9Yq6bHEkCnLjpfj1XYyofakQUqtxLusGXjTu+AWPfc/QCCExlVIP4w+B4EKdv658RwKeq4BMCWHB/HkHSZtuIJmhaKcDSXvlUT9vnwyWkCrT0Zp78GeVopAIQfZ2c4xYM3DulJ9oc7ycAFD+mz/KW3MeTMjinhkfK5Xys1nCnWhBEXclz8fJwnQp3kpVBqD3EZtig5gkcnxUGwOKauxMXRm9kGRDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8orhMxMlNCqqU8sqNhFeD/Zt8GjFtxWMleUgRcyVCkM=;
 b=GvMTStRhtJvOTADX6dU84K4IRmzuHqmP0fOQfB7kT3FPEmWNSWcVHUcfU/zgkRh+1gZ8hfIUOb3pmdh5y0r8WRQANXV8J78t4tk6rHkW3Wj0dHp2ah3hXZiDZnbDMxfcStUBUahvjrECy+cmgs4glmWcQGxpoHDVnG3i24xb0JeTmQtSveuyWXeRgkz6Rz+Ec9qiltNAnoEu+UpL8GHsEg3/fUS35dhAhb8i2VjBhpcfcgU4JVR6maPRmXcZ7dX+SRlJn7d6PQ7npYKr9MF6f/RjXjT8QXt9bPL7R6N5CtKP88OtZZ85KaAhDGSvRk7NmR/knmL5GLeSfwc3kdjD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8orhMxMlNCqqU8sqNhFeD/Zt8GjFtxWMleUgRcyVCkM=;
 b=HQLVOTZGw2uewznK1CCulukqQEfDztgx3OwckAI2RdUKG4QIWCdnKMHEUJltwpZtICdxYceKb62LLaRlc0SSBPzW2CBnjnopICRvn4vc8D5iTX8TI/Vl8qJEEdCfo3fMzHo0ZBSekQy36Am9zIYmGOidGVwyeSyXsDFLofgfSaE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 14:24:35 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 14:24:35 +0000
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
 <95ee0e48-2214-618a-b351-ec8d4aaf0083@prevas.dk>
From:   Francesco Zanella <francesco.zanella@vimar.com>
Message-ID: <38253332-08da-54a6-5497-7b06b39756fb@vimar.com>
Date:   Fri, 23 Apr 2021 16:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <95ee0e48-2214-618a-b351-ec8d4aaf0083@prevas.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::13) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.150] (151.71.13.13) by MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 14:24:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e1f85c-e07e-4852-b569-08d906638507
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16515453FCA3C6AF92E72DDEE9459@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjiMLZEB5QG0H5mh9ID5ko7wqDDiNSUictELb1Dn+54IUtlWhNGow4OvVAQ6+xFSGAfQnhpS8WLaYQgvG09rvgabu4bduhFMSQc5SIiXpM1dwhwWAFLmVUureBKHEJ8oiX6j81SSlok95kwVYxqe3Mi3Um4uypejMhPM+3pet3dgI4pwWzAwMj5ieiOOyn2klhOMiAqG+b89NN10i/caIqKzTou4MDYpvtdAEyLD7Dvg9KhM2XzEnxLIR6SRl5EtPXBsK54rfRbb9o9+4TJag6ZCe1ne+l8+TTVXXe7F5IBKyDJLqfhEaP0Bk1EE0wO+rJBOJKWIDYGCoz4P9wdq1Glu5yoXzAue+XcDGR9MNlu9M3Z/3oz6MmR0mWZAOvyaUsllmzWF4L2Q28YYUIVVc+t68w8eHgglfrHjVHPHDdSqXq/x+JYqxYZEOYP/z3SbF9xaQ6jT31RNmBgwVUiVwItjz15Dm+V6auAk6+4c1/zVay8TZl2I5OMCwu99UOryrvAFnBX8twAViF0ROu43nKMnuIj6fDnMHuE45vhbo79mrlkBAmdn8017wYAbGXmFrVfh85zCdwmqf0mkxO0+w7DCcO9TfEE8rTlOTBxyewRpApw+8a0i1IKjs8bPqjKJizDjYm942gbwe2DWnLTbeKqJ6IHjd+jbsHtUlFHKyrJMvoHZhJ5ZS+HohSLThru0NhU49GUA3fel7vGcYJROOWzF8VX4TwnZqhq0M7+iUcOWzlvLI2PKKw95gxEWCRMot99S1USFnM41yruyVw7Z+PW4rTszDKiSN6GXaNOxwxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(8936002)(8676002)(86362001)(36756003)(6486002)(16576012)(66946007)(31696002)(66476007)(66556008)(26005)(16526019)(45080400002)(186003)(83380400001)(478600001)(4326008)(316002)(966005)(5660300002)(44832011)(38100700002)(38350700002)(53546011)(2616005)(956004)(52116002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?g59bpIowx4yHbr89bBEBG61C30JAvqeJUVjNv/9e6vT3d2Oco8+PMiay?=
 =?Windows-1252?Q?JZMLsKWCi1YSRHLj1osCFYaiAuHv7HMyeFLzDxi2a1pQesbB+/WmF6ZM?=
 =?Windows-1252?Q?f/JClqBbHYaNoS/+l1DV1+To3tA4LVJXJb4pZxoeLb72WDVzseoVUeTI?=
 =?Windows-1252?Q?ZNiJPEYmF5WgCY6ekmUxc4vsRSwjqC9skPBoWsIWI/r6ym2XXueXfy5B?=
 =?Windows-1252?Q?Ny3nZNShyohrSUZMqbPknJ9FGAAPA/cja7s1o1pJn7BdPPfhxQ6dhb10?=
 =?Windows-1252?Q?DL29lL51raz6FReSY+NWQX2nVe6qI5OFRzlejzfw2iJTXw/Iew/IVIgy?=
 =?Windows-1252?Q?RX/2jwaHablMRwXiFNFnvqWMbyxumyd8HkCy9gyYbhKoCi0ye4mIyjNU?=
 =?Windows-1252?Q?4NtrdcSio4EQSoWIYupAIuAcCHPP8uyYeTmZXrTg8uQwTqllSI8jl84t?=
 =?Windows-1252?Q?+7EkxrKa+BRnJBHs0Dm3WJW/jAGLukIKEqGlN4SOr+bErQ3SdsHZwVwE?=
 =?Windows-1252?Q?x9tBufGQBx5NVYkl6a4fRUyf2iakgpTHJr9pS9kscX7HawoBzFOMac40?=
 =?Windows-1252?Q?8mmPzZYpGqA4jtqrUImEXDMlrai50BFCCp4YEmJr/ihLXNkafwD82Axz?=
 =?Windows-1252?Q?3aWcyZkv1e45MYWq9cve8aCV386nGSvACwYHXV6mlWqXS1u6fsly3FLX?=
 =?Windows-1252?Q?idozAi6tM6MnIqm9eA9EHM/sptLDmGv1pgm1lPLKBmsJPfksJDCTBKno?=
 =?Windows-1252?Q?t27DnnjX2nrg7weyBRA5LiKpbJvtVd74q2SovKylQZKgvsD3hlNzShcq?=
 =?Windows-1252?Q?8yvt8gmYdtXWNOAJMcOftK9eKq/Jqz5JZr7iNeR/cFsXFnJ236fz52a7?=
 =?Windows-1252?Q?1L0KDgnHM9UomCrPE+jUPHc8jehlK0OWR32KkCKBvwBaf7qvldPInMo3?=
 =?Windows-1252?Q?pTuHl5K03yLzmm+2xMP5M7Rf0yON35T05cMBDc2h0jSm/ljqTNntnzOi?=
 =?Windows-1252?Q?tgy/4qByAuTO5qcUOEFDo+ttsFQSRCAOvFLms/kJJCgP520ySmWMqL9S?=
 =?Windows-1252?Q?2Aa5iupUmJqiy2OEzIk7KYNAcim4jpW9TRALR3CJu6sd4Bucrd+V6eEZ?=
 =?Windows-1252?Q?4CfH3/+ozGtNOxebAQA9t0Pk3dFn25G34Foej17kIbymQbBBJPvTBJgs?=
 =?Windows-1252?Q?ZVyCBnGTNHIRgdHXJnlhLtM/XZ6s8jVSKDDCHcd6DFhDYyPWg+qdRbuE?=
 =?Windows-1252?Q?weIyCiJwKEZx9kN3+3c06GtR33E/Q0XmTXu5iBjNonWcypPiP+uQhb5J?=
 =?Windows-1252?Q?xc3bycqJ3J97bwVhHTA+s7UUb2LgNIOKbJiCG1RWWB27fljyejKuCYb1?=
 =?Windows-1252?Q?Lir4JMhKklSdYmqRaIT6c3H8H68HAoKw93WnKyHeIr/FHSi9YI+f9bkf?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e1f85c-e07e-4852-b569-08d906638507
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 14:24:35.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6RiTexazJRKABz5rurHpWo+F62vBaxEqhmwNIphrAckpVaoGeVstCiXzRFaVVLxZlEuOmrhQZtLUP3mDW/CCD3jJ9kEPNF9LZPocII0wSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 23/04/21 13:36, Rasmus Villemoes wrote:
> On 21/04/2021 18.26, Francesco Zanella wrote:
>> If "start-at-boot" property is present in the device tree, start pinging
>> hw watchdog at probe, in order to take advantage of kernel configs:
> 
> (1) Are you aware of the recent proposal to add a similar feature on
> watchdog core level:
> 
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F%3Fq%3Dstart_enable&amp;data=04%7C01%7Cfrancesco.zanella%40vimar.com%7Cde549dd02adb45669ff208d9064c0739%7Ca1f008bcd59b4c668f8760fd9af15c7f%7C1%7C0%7C637547745887915290%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=pcqWkd%2B4m6RSS4KwmjgIbLpaa0XSCAOQorwI%2BIle5uY%3D&amp;reserved=0
> 

Oh good! Happy to know that, I missed it, sorry, it's quite new.
That kind of work would have been my next proposal if this had been accepted.
Hope that it will be mainlined.

> (2) If you set always-running but not nowayout you essentially have what
> you want now: If userspace opens the device [within the limit set by
> OPEN_TIMEOUT if that is in effect], but then does a graceful close (i.e.
> writes 'V' immediately before close()), the kernel will assume
> responsibility for pinging the device. So the device isn't stopped as
> such, but if you can't trust the kernel thread/timer to keep it alive,
> the system is already mostly unusable. [Also, how reliable is that 'the
> timer is stopped if the gpio is set to be an input' anyway].
> 
> Rasmus
> 

No I would like to be able to totally disable it with stop, not that the kernel
will keep it pinged.

However, glad to know the news, I will follow the evolution.

Thanks, regards,

Francesco Zanella
