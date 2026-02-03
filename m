Return-Path: <linux-watchdog+bounces-4895-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP/BKv9Igmk8RwMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4895-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 20:14:07 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF2DE157
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 20:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98A01309D1CD
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 19:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0257B30DED1;
	Tue,  3 Feb 2026 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NMD7JjHi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35802EA490;
	Tue,  3 Feb 2026 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146044; cv=fail; b=YS7M7ZePSUhj3TAVJQAm9c4VewDuvCckhTLIi+m0l1JJROIxsAyddvo33LCcBGBySb7rgX3kGhmbUQdSW7bfWvPnq7Hnt8JiPldPHPKXEYgsbW01NgtkJ+rySXppbmpPaRk3JPhqA6AgWeJlev2SRBrJ6KZVZ3+rvcNBqDfPDJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146044; c=relaxed/simple;
	bh=ZKTdbhxpuv/yOdZzRFSZCJHol8qPqJPQ+Xd9J2mEP2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R7AeDN89iruM9HxjgyuPeNJ+AvSEME2L0CWP5Xwu/6j7H3JRu0AjomWJbnrBaY+kYTmZ498sCt0LyuyDj+OF3sH8A1pYPz5C5QzipXbdu405VpaBhTRXvoL6pyxDJeAuC6MhVwol+PXlOEBc962QkxgDpC0z9uZI53KKfuisqgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NMD7JjHi; arc=fail smtp.client-ip=52.101.85.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9x4uypFk1SvRtKDjyEGoNvWBAu+3CJIlD0SkviOG5LG+AakZwpfy0GwnRFFpaDSl2kPR3fZoTAW9pL+7p8L/7Quk7H2ohOKPizOJQcDwc9OV7z29O4YvJiQQ5Yty13wRrt7XSswPCqke04+rVpKgxxwOvBXWVmbpq2wQVHIkWtWrtqUhBQgfTcJ8WItKwQLkl694fBdqNovB7yhc4TAnF4Z5kVW+hJDrl/9+6Pi1Xcn9AwaAhYnJChEpoqIuESy39h5m9wsFHCisKuYRRxQeyb14PSRgz3W34NpUWv33JUOI1Tc+IlM8PqsCtR/GzH9by+jgfskZ7RP7LnhPSTVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BJW1V3N4F4MGpA5GUu+w5ViPbpWYGvM91kIrZ97aZo=;
 b=bAubc2WYPh61u1/rK2Cm6w8qwqz5RDjr/bGhGXNZmFsV5dSB4DGaZDmto8GsZyhz0IWGlE3ILewFTcknDtRQNepiX+ylq3peV5gBrn31XoNouiLmAuiJXuHxftFU1ta2ooS7Hxgo2gw9djHQ7gI7XFuuWZ91+qHPOIR4tp5OduMUSBWCu53XXCrNpk3Qga20hF/wctIHQfLD19w1zw4tAslj/L3P/1cKuWVkjdgeIJ9FuFQfC4LDB6VfnQAJVyVsKFwNuDpjtvIA88f4KyDqICbPziJl9dO8WeYQI0zTU7wLC0OSHTAk71jF9AqtL561SUOgnmWpMmnFsifeMvIQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BJW1V3N4F4MGpA5GUu+w5ViPbpWYGvM91kIrZ97aZo=;
 b=NMD7JjHiRyYR6RBmR6iKkeizK+mJmJ/jgFsKVk2F5+CKe92QMBvWBdDkPn5msyB3SbwyNtwHNEjjGdcxCF/95Qhpx0vSNIg4wKoqvUIrT2MmrzCYi+/X4J/FJtfcYEm/DhynnBmjGVfRY36bXLzD0ReGbixk+nkMR5jyJv/qobY=
Received: from MW4PR04CA0203.namprd04.prod.outlook.com (2603:10b6:303:86::28)
 by DM6PR10MB4281.namprd10.prod.outlook.com (2603:10b6:5:216::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:14:00 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::25) by MW4PR04CA0203.outlook.office365.com
 (2603:10b6:303:86::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 19:14:00 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 13:13:54 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 13:13:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 13:13:54 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613JDrqd246268;
	Tue, 3 Feb 2026 13:13:53 -0600
Message-ID: <8af0bb91-bca8-4c62-ae9b-a4eb91223a2e@ti.com>
Date: Tue, 3 Feb 2026 13:13:53 -0600
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/2] watchdog: rti_wdt: Add reaction control
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260203181931.1496723-1-jm@ti.com>
 <20260203181931.1496723-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260203181931.1496723-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|DM6PR10MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3f7d96-ed94-4cbb-c4f8-08de6358631b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmJNT0pCZ2loWEFBZklia0ZXYmE1dEs2dlEzRm1mMU1LWEpOaDdzVW9pUzM3?=
 =?utf-8?B?am9ZbjZtYWtrdVBGOUR3clVlVWFlckNxeWJ0eDgxelU2eldUUVVQblljQ0dR?=
 =?utf-8?B?dldWMmlKN3Uyakk5dXpIZ09UVC9TSzdwaFlpdkpCaTRUYkFOU1BuZks2Y3da?=
 =?utf-8?B?TEkxdk15UGp4aUtsREIrUzNycE5zSUtBVkpoV1dUbjFsSlJ4c2FzQXlSa0Zu?=
 =?utf-8?B?N2JEcURMNUNlUEpEUi9TTTFFU21PSjBwVjFOYktpdjM1UUF2YUN3c0tKM21Y?=
 =?utf-8?B?aGViRlIvQXVwZGFKQ1Z0WUN6MW9nMERtcUlSNmxsRzg3NUtEVmJVUFo2bU9N?=
 =?utf-8?B?R0MzMlVwQkg1aHBtajhZNUs5UkJBKzdBMExKRWVPRjNwZHdvSDVZUEFUMWU1?=
 =?utf-8?B?V3hhQkg4dWdaK0ozWlRrY2hSd3lvRjN1NkN6OS9Ta1pnOW01ZXZPQys3T1pY?=
 =?utf-8?B?QTVLd2NMLyt5Y1ltaTh4blhCVnc3Z0lSTnZzdXNDU1FzdXRyU1hXM0tFT05N?=
 =?utf-8?B?VnY0Uno0b21PUFh5cFQ4aUZMSGdndFZiVWVtWjFUWC9QeWdJU1hlSlEwZCt0?=
 =?utf-8?B?V2MzQkQvQjgxNHZ6OTVQODBsOHZ5bHVzUU1iZ1FPZXVOZ1BRZjc1RlM4ckls?=
 =?utf-8?B?MlM2aEo4K1ZiK21xUzFhV24rZ2ZNNDdnckpwa0lQUXhJOU9QaXJIM2Zhamk0?=
 =?utf-8?B?ZktwTG1RMlZHbTE2bmpUd3p6NGhuZDBXdEw1ZFA5cC84WTI1dmxKZlN0NzBX?=
 =?utf-8?B?b0dJaXIwTnNLdmJ3bG51WEw3S0dxUGRSVGVBMTFYdFk0VWJXWlk3dWxTTmsy?=
 =?utf-8?B?VU1xRmpjeWRiL1gvSXFRRUZGWGl0VmIxckVOUjMyYnArcFNlSUVncVE4SjZL?=
 =?utf-8?B?U3k5L3lqM0dDWm5vSVc4ZGFLVjltRHQwU054aFFhUklKNTA1bnIxWmlXZFhR?=
 =?utf-8?B?UEpWNkt5d2hqeFJUV1pFQVkyZllHb0xkME84dHUrNmpHK2NEaFdBL1pVcVFx?=
 =?utf-8?B?KzhuaXhpNjQxWEg0NE5pZkZCRlNEc0doUVJlR1hxM2w5WmFxN2szVU1XNDdI?=
 =?utf-8?B?R1V2c1pmYjFYTjMrZGlveWRDNU0xRTU0VmFJMmZXb0lxZWtCdEFLMFJCcUNy?=
 =?utf-8?B?Z3Jxb0hkT0dnOEw4cHBSUFBFeXU2R0phbW4xYnJ5TFFEcXZBeXY4L2I0ZkFG?=
 =?utf-8?B?T0dYcmhyZVJRWGEzNllsNlB5clpRYTFOY1JyL2pHVkdhL0orWG45OTIybmM2?=
 =?utf-8?B?aWpWcCtMODJzRDRvSUtmYkM0emNiTmdvLzl6dGRvNjFwVmdLVmI3SzRuV3Ew?=
 =?utf-8?B?RmN6YnltSEtQQzFQMG02RUZCL1h0RjBPa0F2YWp2M1ZRL2oybzZGR04vQUR6?=
 =?utf-8?B?R2YrWUkrMTdnYnNPdk02WExQa1YwSi90VkV3RFZRVkQrVkVBS2owcW56N3Z0?=
 =?utf-8?B?VzIvbUNMMGNsajU0YkdLaDMyaWdTUHowdDZVYlNoOU5sd2JUSzY4VTJNbFI5?=
 =?utf-8?B?bDNJRVdicldiTVZkV1FLZkVRODN1Y0JzVFAwcXJpRDhZWmk5Z0FFKzdnLyt1?=
 =?utf-8?B?KzBod1hZVzZnY1hlNC8wZ0dNSjRCd1FPT3ZRR0RaYk9LYVJaK1l6dTBqT0Jq?=
 =?utf-8?B?cURCSTlRMzQ3eEcwOC9FWG5yL0pzYURmS3pBQU5pb1NCKzJlYzVEaTQ2OUVP?=
 =?utf-8?B?MGR1WWdyaHVOSDA3dUJxMHFPc3UwUHZMN2JWZTJMWDA2d2h4NkhrL0tEQlVB?=
 =?utf-8?B?ZWovQm5sTW9mc2RxWCtXMy9YVWF0TE9DRXdJVzAraXN2eTVUaW9VK0lHU0JR?=
 =?utf-8?B?cWp6VnIzL3BRWXJjeXpjL01uNnd2a1lyZDRqTFEzQnJpOEdmNEhmM2g1Mzha?=
 =?utf-8?B?OWF6Tm1QbWFJZnU2blhncnBqK1FBSStETUxLenVwSER5N1hzOEFkL1dPUDJW?=
 =?utf-8?B?OXNwL3FteHQ3NXYyamZJZTRFVG8wMGRlTW1ORnIrRXc1OW5yUDRWVTNNRlE2?=
 =?utf-8?B?Z1BlSTc5empncVJRaFFLR2tzd2RrSnYxdk0rNk8xSnhTWWxDSENadEljaGgv?=
 =?utf-8?B?Ump1bXhIcWlLMkw2bTRXZ2xrTHdxeUxlMFdWUTU3QVhCRFVPa2VkSWRjem9k?=
 =?utf-8?B?WHhxcGNnSFpHdDJkNUl3ZlVTNDlNYzNHeTk1bWQxTm15Y2VicFBsc0FoQ2h0?=
 =?utf-8?B?VE0yYkJFOE02VDBVRlRwTklwU2YrcXVBMitGSmMrZ1BBTWxKMVNPdnFySVZr?=
 =?utf-8?B?eExhOHlZd3R3aHdFc0VOUDlZSytBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iit3RV0ojXsyABa9TXqRMmoErLBwJuvj9KyJwPMuPTUKyxlB9nJhb3uhYkODc5IHYvcLIOe3WzNIRTcX+UMo1b/GoefpQjBl4EtkDFxL3sLzDtS5cMki58ecfUHhmk01DUkB60uDeJLFx+O1XBQx2jX9VOgR4l3KNjbLeQ/o4sc/IPjiFMvfB1+4OCgtODK4zs4YCF/OJ+R+3M86lsK35uhekxsr0MV/N3MYQPrZ1rUhyncG92EKUxPcIaUcvvFCL66l7Xgbbdq3sCbzacw2NTKXa+y7NVfxOKueB+G8NYzeFp1AELLckEvTfnjv5a11aidc9nVz6xei2/KTgZ83KiVF0lTg7qSg/PyjMGPeJjZMlQXVt8H2SYxdc+h0Pfe0oDUNZyEDkvpsqhCwzMYyQieQSRbl51+M7fMgGUfIVmFP5v/OUka+W5iEfdQygTEK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:14:00.2901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3f7d96-ed94-4cbb-c4f8-08de6358631b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4895-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1BF2DE157
X-Rspamd-Action: no action

On 2/3/26 12:19 PM, Judith Mendez wrote:
> This allows to configure reaction between NMI and reset for WWD.
> 
> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
> to the ESM module which can subsequently route the signal to safety
> master or SoC reset. On AM62L, the watchdog reset output is routed
> to the SoC HW reset block. So, add a new compatible for AM62l to add
> SoC data and configure reaction to reset instead of NMI.
> 
> [0] https://www.ti.com/product/AM62L
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index be7d7db475911..483e22efedf9b 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -35,7 +35,8 @@
>   #define RTIWWDRXCTRL	0xa4
>   #define RTIWWDSIZECTRL	0xa8
>   
> -#define RTIWWDRX_NMI	0xa
> +#define RTIWWDRXN_RST	0x5
> +#define RTIWWDRXN_NMI	0xa
>   
>   #define RTIWWDSIZE_50P		0x50
>   #define RTIWWDSIZE_25P		0x500
> @@ -63,22 +64,29 @@
>   
>   static int heartbeat;
>   
> +struct rti_wdt_data {
> +	bool nmi;
> +};
> +
>   /*
>    * struct to hold data for each WDT device
>    * @base - base io address of WD device
>    * @freq - source clock frequency of WDT
>    * @wdd  - hold watchdog device as is in WDT core
> + * @data - hold configuration data
>    */
>   struct rti_wdt_device {
>   	void __iomem		*base;
>   	unsigned long		freq;
>   	struct watchdog_device	wdd;
> +	const struct rti_wdt_data *data;

Don't store the whole device match data struct, just store the
information you need, so

* @nmi - Set to true if this WDT instance supports generating NMI
bool nmi;

>   };
>   
>   static int rti_wdt_start(struct watchdog_device *wdd)
>   {
>   	u32 timer_margin;
>   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +	u8 reaction;
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(wdd->parent);
> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>   	 */
>   	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>   
> -	/* Generate NMI when wdt expires */
> -	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> +	/* Reset device if wdt serviced outside of window or generate NMI if available */

I think where we had issues before was this comment, it should match the code
and it can do so while being very similar to the comment as it was before:

/* When WDT expires, generate an NMI or reset the device if NMI is not supported */

> +	if (wdt->data->nmi)
> +		reaction = RTIWWDRXN_NMI;
> +	else
> +		reaction = RTIWWDRXN_RST;
> +
> +	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
>   
>   	/* Open window size 50%; this is the largest window size available */
>   	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> @@ -254,6 +267,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   	wdd->timeout = DEFAULT_HEARTBEAT;
>   	wdd->parent = dev;
>   
> +	wdt->data = device_get_match_data(dev);

Should be rare, but this can fail to find match data so you should
check for NULL here. Then as above, just extract out the data you
need (nmi).

Andrew

> +
>   	watchdog_set_drvdata(wdd, wdt);
>   	watchdog_set_nowayout(wdd, 1);
>   	watchdog_set_restart_priority(wdd, 128);
> @@ -361,8 +376,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   }
>   
> +static struct rti_wdt_data j7_wdt = {
> +	.nmi = true,
> +};
> +
> +static struct rti_wdt_data am62l_wdt = {
> +	.nmi = false,
> +};
> +
>   static const struct of_device_id rti_wdt_of_match[] = {
> -	{ .compatible = "ti,j7-rti-wdt", },
> +	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
> +	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, rti_wdt_of_match);


