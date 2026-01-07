Return-Path: <linux-watchdog+bounces-4758-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6ECFCC10
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 10:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80C6130D1D39
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 09:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AF32F7AAB;
	Wed,  7 Jan 2026 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="AGsmLxQp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F32F60A7;
	Wed,  7 Jan 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776705; cv=fail; b=RXBZPpsJ8ZAw+2Ogk6c6JhKh3b7jp84brN64AnGt5yXNaeXDK9wogt9yQ7jqmKFD48tIJozD1hj6LzXyu5J3YsdnDW2qM6sytgVVo3jT+kwvQklr1VTdWpqHbSeUURjpL8l7nGKGK+EBYuUhQtRJpvoDej5xCLPeAh7crlRcIKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776705; c=relaxed/simple;
	bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epGGcszugsCkjTFL8cFrDbhtIgyvfokeBUuuBdDRe0bcwytoluCjDQkuMrwQ2ex3XoIUYPSudPhFIOO7XtYbIBRVSi7rrDITFd4YxvahE4lqCCBbiFBmU3QuJxBUIzzgUKEvkSP3f8ZJ7+rcYcupWCIC5SVwKLDTieicI1XrAHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=AGsmLxQp; arc=fail smtp.client-ip=52.101.56.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUGoiUP8cyvsp21mlf6qV9DBHL3tUZ/uw9QFIpzFBewQ4Eso58XunOrW3xqadWGFaTtxEp20neNfKaz8AzZybYB3kvvuWzjkYZTOW/aT0yS+y3ViWT/mq4cnfjRjSYdzUIVkak+mK2ikkm+aV8Dp0Ygf/bUJTXdDP8Yj2ubmA00opCiOpbm5KUs8g98VyCVbDnlWq2bL4rlhiN6i6Y7wYutUcfA1lZHjdYg1et/af7bP/kBKNW2gQYzaF70BYCCTIC8tG+zgJfzZPkSWZTe2RkUlqxtUIjgIyCKgQRO5IFhPDrZ+0l8WJlHrwUQYcrREgcVfUVgxxIYw8K7Om4dKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=YmHgP3wYQVbcMpr1sLPgPfhKp0kPL1oPBqJPcx+psRwIV7bcNopU0CceLUteOvEs/Zr3527FD71VZGq4Xd+R7pagIKBjCLVl02Xp0/79SYJSVnzIlN9auEDQ/nbuQui5QG+HGyxWq32ZSRleTTDF0u2s6Vmm31LNkr0f5C/8sieRhDeXh/pTc8tNBSK/7Mht59llloeam26vrDm3tODXuxLUrV/Td9A6yZsnJyUIgBy6o7CJrp8ccvN5ZK1WKqwzSIM4v6+k5M8D5UTVWVVnNoxWJMJihX0HI4GPWVhfWDpQ2mOuMXRsdadUgjD0jI2vmpufJUgepgcGgauHOw1KIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p39iNntMLOx9UO7KZPFUtfRegxn2BFsNmVKOlVvoshY=;
 b=AGsmLxQpYVd6XyOiGhckWRqH0geYVxryYZ6fIa8AZw7TmrDWINJZNqcSG+2pvtQyP5Jkp4XQ4sQogCVsEMr9kOPu0x7OdIUooTCmVB9jFDrkEheH5fx24U1Q0usaVi179ipL4LUetYoX8XfQaDNioLdjYPynvMhB4m2tK6Nj50VdmTKbul/Zf/xsAm/G9rz4TZaDzFYrFDJkCUY2b9IvWvWp8409ZMWr9O9JrYoYufu7Y7iTpD/jr+QRoYfnwzNEeIaryiSJnBj5H6REDwFefN1p/ZdAirXDtfVaF7hWeYHXfQ67V9MEv1QhIUqBkuZUsPrbI4Pf1fJZ7T34PcjrDg==
Received: from CH0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:610:e6::11)
 by CO6PR22MB2947.namprd22.prod.outlook.com (2603:10b6:303:14e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:04:59 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::ac) by CH0PR03CA0276.outlook.office365.com
 (2603:10b6:610:e6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:04:59 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 3A05BE57C8;
	Wed,  7 Jan 2026 11:04:56 +0200 (EET)
Message-ID: <0c3ebcfe-dc45-4e52-a86e-cc776b3bcae2@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
 <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CO6PR22MB2947:EE_
X-MS-Office365-Filtering-Correlation-Id: aeec31df-95f8-43c1-8805-08de4dcbd5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmhycFVlR0htTk8yeTNZSHZMVDFGMnNHSmo0R01oM2NkOUtxWkxVUnkvdExR?=
 =?utf-8?B?bXFGSll1VXRMRHZqVkN2NFJsdnNVOEI0dmFJZXZVOE16eG9yK1JLa3Bpc2dj?=
 =?utf-8?B?QWpIY0ZmbUJMdENhdGNYRUdVbnBLWWhyZW5sV25LbHhwMmxMdlRJdnhiM0Fy?=
 =?utf-8?B?cmdWMElHQWNoaUVNSkR0U3VJalArWFoyMlZJYSt4aUhIdnQ1RVB5ZWJFWG95?=
 =?utf-8?B?NGVHWXprZ2IwcGx6Z0FyeVZ3Tk50VGR0U1VJbWVELzJhMG1mTUhwUXAybG1s?=
 =?utf-8?B?eFhza2JrWHF3dkhVNkNYUFhPZnQ1UlROUzV6cXM3NUl4WmlXZlFMSlN5SndQ?=
 =?utf-8?B?YzJzdkNXaUhUVEoxZlc3amU0dm5QQTZPcUNhQ0pyNGxjaEtHVEhLQUQweFYx?=
 =?utf-8?B?NEZKOGIzMVRvWStrR1VRN3RvYWdDeUI5RDU1emsxaXJQZkdXdFdTdXVuY0tk?=
 =?utf-8?B?SkFJekRkSUtBTEpZajBwc3Nhamx4Z25YNytyWjRRYlFTdU93M1poYk4yUDU2?=
 =?utf-8?B?YkVtQzAyRFNmMUpiRlNRT3gzdXYrV2NEOGkrSnU4L29oSVhGYmV5L0gvTVFM?=
 =?utf-8?B?NHlmR0d3ZGh4bkxGbVd6RkFFU3VSRDBZdU5JTmtsd1JDRjh1WnJGamVXZ3lX?=
 =?utf-8?B?MklsTEtHTGNkM3JaSFlBZ2svTWJhSTNSelpZL2ZpZHBWZHlhQkZXZE5PZDFU?=
 =?utf-8?B?U21Lc0VkQXFvTHh6aWVRUkRUb1l3b3BtM0M2RkJTb1BxN3RXR3JISWZBNWFo?=
 =?utf-8?B?VEk0Y2ZQYjN0K2lZWUpLQ0p5UTJvRmVWaTJ3aXUxSlRNY3pSVGV4Z1hyNjJQ?=
 =?utf-8?B?ZXNuMUpjUHRtMk51RTFDWGNGZ0lWZnBSTEJzUmVFbkxuRHN4eVFRUnlmYUFt?=
 =?utf-8?B?MTNKMDQrYkpBejZOKzI2aWFMUjZvQ3c1MzNoUXM2WDFxWXptVE9ENDJNMzFa?=
 =?utf-8?B?T1h5Qm8rRUlIYmhXUFRZR0NibGxtN2pyNVFuYnJnaUpxQ2Q5aTVZWFMwSDJ2?=
 =?utf-8?B?bnBjVHdRdFZpTnI5UmxOZ0dJMFgwdWdFeEpTaSt0cGlMRU5kZUJSMzJ3NnF6?=
 =?utf-8?B?Y3pPREVDNmVpWDAxY25aQVZhSVVmTENrQjgvRkZlbWhLNEcvajdGMWxXb1N1?=
 =?utf-8?B?T0llcVhtQmtta3I2eUtONEpGazFBWVI1OWVQM0RZdTBTcDBGN0VRSGRjdHBa?=
 =?utf-8?B?ZGdldk01anFhZDZoeFNjNEdMMENuOWxSTXNCTENlU00vazlqbEI1Mkk4SlR3?=
 =?utf-8?B?eEo2dmZTQmJNZ3VRT2dUL3ZGQTdWVDNMWnZ6Qkt5M3lJVHNTZnJ0cVdZUEJl?=
 =?utf-8?B?ZzMwNUNvZWkvUTdySnpJMHZScktieWc0QzRnTWVRM1hLd1VsVGdBa3dPMmY4?=
 =?utf-8?B?blQzMVRDTmhqM0srR0tUNGpEcXNQZURYNVd0d0EvS3NsUHFNYWpXTTFwNmEv?=
 =?utf-8?B?bUZsK1BOVXI3dUNGbUZ1bzJ2L01wTlhMZitJQkVvbmhPQTM1c2ZJWGFGVEli?=
 =?utf-8?B?UzdvbFRSb0RhV0dMMTlTREdYOFIxWFBvK2xxQVdXSmtsMWZqYzZMRmhUWStv?=
 =?utf-8?B?V28wZFd3MFB4SlgrSG5aZlhmTWJ0c1c5K0xrSFZTTVNMNTFwZHNrTWxSM0Z1?=
 =?utf-8?B?NTJEenpkcm9uQytjcnZMdzFPZGFJWklmTHZOWFBzQXVuejYyZkF3dkxQOVA5?=
 =?utf-8?B?c25sQ0lMdEg1aHVTRk5CenR0VUtncllhZjM3RXRnUUppSW5iM3RLczZjT1Bt?=
 =?utf-8?B?YWpLcDZkNC9yQ1lOd01qSFVUb1FRZFBPeDI4KzdCeEYxV2ZEcG8zR1dISFU2?=
 =?utf-8?B?VTJ2YU9ZU08ySmNyNGNDZzR2RjA5S3dKSDQ2dmVIMXFsMVVWNlZ5NldlY2I5?=
 =?utf-8?B?T3ZBa2cxQ2hmbFAybmNMblFNTjh2bWRQTi8yQ3NKK2ZIOUlrUU9aTkhWQnk3?=
 =?utf-8?B?aVRsQ2h3aVpwZXJIWlZ0RFBrQk1mdE02T1RuL3hONC93dVcyQ0JUVVNPWjBO?=
 =?utf-8?B?am8xY05rUU45UTI4aEZObHhDUGRXOXlidnppdjUxb1NhRkd3a3g1ck9OZVMr?=
 =?utf-8?B?RG5zNjUxYW1RYktGUmpmTDB2OXcrb1VDYTlFc00zaVdxZnd6UUN1RTBZQ3B5?=
 =?utf-8?Q?Km6s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:04:59.1860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeec31df-95f8-43c1-8805-08de4dcbd5cc
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR22MB2947


On 12/30/25 14:35, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
>> By default, the driver suspends the watchdog in low power modes (STOP
>> and DOZE). In some situations this is not desired.
>>
>> Add the possibility to configure the continuation of the watchdog timer
>> in the above mentioned low power modes.
>>
>> Note:
>> Please be advised that the difference between the variable name and the
>> device tree option has been intentionally selected to uphold the
>> prevailing driver functionality. This ensures that the watchdog remains
>> suspended by default in low power mode, while also facilitating a clear
>> and intelligible device tree option name.
>>
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
>
> Best regards,
> Krzysztof

Thanks Krzysztof for the suggestion, I will take a look over the doc.

Regards,
Nandor



