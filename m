Return-Path: <linux-watchdog+bounces-4759-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C304ECFCD06
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 10:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EB3C3011EF3
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4FB78F59;
	Wed,  7 Jan 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="bSGxBXrm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2679221FBD;
	Wed,  7 Jan 2026 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777181; cv=fail; b=EqdGv2Urn9XM7A3jmMI2hyMi0LRI5IOCM+Nit5wUgmFaF1dAJe++npsTLd8uXEShBTvOWQRu0fF2QNhP37x6IuDVIK7K0Rnm9Hv7amTMmtSy71mPjtmZd92V8ROc4om7Vz9BF4nwZM1fBAh6nlmtxw2sYm0OlO/BxuXI5V5HiU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777181; c=relaxed/simple;
	bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hELSDZGjyM+/NYwXvNHRhMi4XMOcaQ70nOtPhG+G6cxpU6+Cw41DbCoZtF26ZTvB3yRZAXb3npFBskMQ0XXQh6KyJr1mgd6AEjxJ+1R3smoBLX5sMk82mo2TyQyPEcx8EKPaCG7kApv0hkZt8VsEgY9KMf2KxHxprYBdSovrkMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=bSGxBXrm; arc=fail smtp.client-ip=52.101.62.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENxaa/gghQGST3eWSGjthQffsts5E0Vuf0SWr73xsRbsAe7FmAmjIeoSCTWmwVt9mSABzheDwsps1Kvb/Pf4v5/HNIerJjjT9eh9Bte1PUnkEyZGue5aloBsCMZGnoANfABnyO3XEvB30Sbmbv9Az9D/nmfE83k9nXty6mWdBe4VoUSab34c2/0JpmM1msM0bTKPPamV1BN6XOmuztU/YWJX4VcIjGsbEsTqklRU7G9QFypyJpJ5u1nM+9De4Td9CdSbgSKzjqmMbyY30GZEsAD/iFqEhpRFZYpeNS5vs1uCr9lkWk7iiNkOPhaCk+WKtJvMuTs4PKCKefnqYiWUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=mON+jmYNKphefBhObvrvYRt1mFT4V8iS8sTi5nwJyO2GpkO2LyuNjUvMPw49ysz/N+U73oBh0pqctEHof1lCZY2AmVcEme5tBznalfE1Ij1ZKXrVr2r3BJMEtooQaND98HJkaKIGkuuxyT/PPmKocoU+VC6cN0ua6o7eLfG/49Xu2vlwEpJ2U9x8doYWHM1InJpu0QfdusDUNjk+CoV4DCqVWFdL0CYQetUeiAzDFMWOBYYmWgfn00OZYweNonjP8dmTC09gi7FDnMBiuzK6Cx7a5oKFpx8M6dyL8oBD3MOXiPl4Xx0Wc3S1vHWjHWBqOMinlN5JI3Dcx80ja2dgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=bSGxBXrmRJelGM9rtDu192lGytEquHD4+mr0oAJIeg2v0/gJCwb5ihxgiSJyZ52oEKxInfHn1aFI4+PPczhQQ2dl4dPxgYWHgmmMeRA5G2A5nhwQZJDIQ5Zjxxu6DVlbPSOyVMsDJRPy6uzqsVo3kz75z+DARKtdDQOr5z4BzPSRb/q6pxEq48fsGk640q6pZHV6Xl8sSij0xWG/IGgtfxg8dkVFYldK0b/fBM44HjF42V5NURvssoBxTVgXJ8I/wJB/283xVUOe68TF9cHbyyc7sw5xLZafiZSYo8EBDUnB6MGGmwUPLpSrhsa6FMA5yANFy1O4sz7vFDb08JZzhg==
Received: from CH0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:610:b3::24)
 by MW4PR22MB3738.namprd22.prod.outlook.com (2603:10b6:303:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 09:12:55 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::f3) by CH0PR03CA0049.outlook.office365.com
 (2603:10b6:610:b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:12:54 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A8EA9E57C8;
	Wed,  7 Jan 2026 11:12:51 +0200 (EET)
Message-ID: <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MW4PR22MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 215ffa03-7adc-4dc7-3c63-08de4dccf12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFFPMlR4RnN6WUFOMlJpaGZEbDlrNlBZb1orRE9VV1lJQ00xUko0SXAxZW9u?=
 =?utf-8?B?a01Fc21pQXFmbmJqZEpKM0ZDbHUvdjU2eEN6OXZoVjYvWHFFenhWWkFQOGli?=
 =?utf-8?B?cHdDcmlYLzIrQ2pMNXF2MllJbG0rOHNnSHpiQndzK3Vwby9VaGdtTzAzeE1x?=
 =?utf-8?B?QVBrTDNYTndLUytjVHNJVVVWTFhtd01MUkI5d01xcWYyeFExTVJJOFZMZzlm?=
 =?utf-8?B?WFRleUsxMVI4QVpLbjBkMi9neUM4N3BPbUY2MmI5bEp6RDRnNVZHcXV3QWpQ?=
 =?utf-8?B?by81RnRkbXp3dG4wZE0vWFQxYnZrZG0yR3R4K0NBZDl0M2dZNy95SlFLYTFY?=
 =?utf-8?B?Z25yWUFiOFVYMkFjYU9VUG8rbkhJQy9WcEpteFFZdkxacThPYlh3TitqNTdY?=
 =?utf-8?B?N0ZiaGkyVy9xaWlVTjhYZytWN1BQVmd3amZ5MmZJM3ZnZGJ3U2RNT0dZeUlh?=
 =?utf-8?B?MEdoNWRHOHYvYUtHSUlSNVBKMkpYTmJwZUhDTFFkTDlNWEVUVGIyVHBhRE9Y?=
 =?utf-8?B?NlRIaW4yWStYT2hOZXY5Q2dzZlhoS3RDTkV2ZTBsWk1qb3ZBSlhWRHpvZnZv?=
 =?utf-8?B?c3VvNU9yOXZ2VThIUUp1SVRsNEpjL2NLUlA1b1hpZHp1NGpoSVRiYm1TckZC?=
 =?utf-8?B?Y1lIcnBTUjc5S0R0OFFIQjQzTkUvL1N1cko2Z1B4aEtXSjhXVGd3Y01ZeXd0?=
 =?utf-8?B?cFhJU3FMRDJ0WGlQLzNJN3hJeEJoQmVEOC9rNzZENy93Q2F3ZEg4SDZZdjlh?=
 =?utf-8?B?czZkMlBZelZ0cGhjSDlvU0ZtS28rNnFiODZVSVRYcnJlK0ZuamM1RUlXeXZI?=
 =?utf-8?B?a0JhdG9FTXFvY0tsRzJDbEQ3Tm1pSkFvbmpyMFhNUFNKdXpIbWVpSTh3dWhY?=
 =?utf-8?B?Q1A3aGJQekxTTVpPclUydHBBdEtiLytBVW54V1VCSExTOXdoMks4azdhSlJ6?=
 =?utf-8?B?YTZrRUFFaFkwSDRHbDdVdmZzVXQwVkhuRTRVa01kUHVSMXJrSFZNdzlzU3ht?=
 =?utf-8?B?MkVmOXliT2IyWjZHZHljV0xqSjhFQ29kWFZka29NcnoxUEVXWXM3WE5IVHJi?=
 =?utf-8?B?SzRHZ21MNk5xSVAwMEVBelRNcGFUM2lpVG42WUlPdmJQNThWc0pxSEM2NE5y?=
 =?utf-8?B?VW1WYUVFc0lSUTE0ZjhHcDNnMDhTeStvWnQvNVRPVngrSjV4aStwQVRNSGg1?=
 =?utf-8?B?Q3B4cVQyV3pkMXlIclQ5VkgwTEJGWDdmYmJRNEYwL1BFL3lBRWtudDJkMUFJ?=
 =?utf-8?B?M0daRm9ZQjRLdVNyb25Na3VJcWE2WTQyMUY0OThDWkR2WjhxTGJTYVN2UnBV?=
 =?utf-8?B?MDVyREd5L2RvOEhoQ3JhR3lMN1ROUXJSRk11SVg0bVNYWWkxYnV3emlNTktj?=
 =?utf-8?B?U0ROWWp3NFBUd2ZNeHhWSkZNc3RvdzFPcVBwY2l4S1lBbTRJRVluZUd1SWh2?=
 =?utf-8?B?MkV3UTJnNDFKR3RLYjgyTUMvU3ZRTUlDSVF6cXBwcFhlZXlnb1lkL2NIZXVY?=
 =?utf-8?B?dXFGeWljcEpqQXBjVmpNUnlldmpEWmROVVNRU2d5R2x0cE5jRVgyMEpFNm9r?=
 =?utf-8?B?anNkR002c3liR3V3dU9yU3pVd21TS1MyNmFjeENadXlnQUVUV1lGOFM4SG5x?=
 =?utf-8?B?ZFNMTU5aeVZjNE5zSCtEcWRMNFg3VEU4aWhiWFQ5cm1YVGhBenNvUlQ3Wnhv?=
 =?utf-8?B?d3d6UmE4UjhQVk0rYlZOY01PSUsxRGZWNmVPeWVHMUNxZ1R6eE0vcUlvUkt5?=
 =?utf-8?B?RjJZU3JBUzhJdXBzbWN2UzdPQTM1eFdrakRyNE12L3lMY2FJNmNSdlVxem1x?=
 =?utf-8?B?SVdtcG5KaGlEVzFnVDM1WVRyWTFyOTRkYmhYeWYrdis3ZFBYeTRzM1l1ZG1t?=
 =?utf-8?B?NmdKZDNiQ2QwalJFUVpuai93c3lrRWg3VGhackY0NTF0QmVMdlhZaFZoWXNl?=
 =?utf-8?B?QnlEc1YrUlVCNGU2UklyWXBtdmFHQSs4LzNadkhCYXlHMllyaytZcng4dkFI?=
 =?utf-8?B?RU11UzBqdVljalUrWThmKy9aTVcvOEVmS216RVY3dGQrVUFMREttaUxGNGk0?=
 =?utf-8?B?QmhLRnpkTVh0cytKcUdJV1I0Nk9uSTZUYTRya1JjYUZRRjVkaklBdDBQTk9z?=
 =?utf-8?Q?BaW0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:12:54.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215ffa03-7adc-4dc7-3c63-08de4dccf12d
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3738


On 12/30/25 14:34, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> And why exactly would that be a DT property? If system is sleeping
> (assuming this is what you meant by low power), no one will pet the dog,
> thus watchdog makes no sense.

Thanks for the feedback Krzysztof and Guenter.

In our case, low-power mode is disabled. However, we have identified that under certain conditions,
specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
one of these power states.

> Otherwise I fail to see how this is a hardware property and we do not
> accept SW properties (see writing bindings, numerous presentations).

Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:

(From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
---
WDZST
Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
once-only.
---
Given that our system does not support low-power modes, we intend to enable the watchdog across all power
states to ensure the device can recover properly under these conditions.

Regards,
Nandor


