Return-Path: <linux-watchdog+bounces-4875-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFoKEFROgWlMFgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4875-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:24:36 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0278D359F
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6372F3031AD0
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 01:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAA22264C9;
	Tue,  3 Feb 2026 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ufEbXr0r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6D221FBA;
	Tue,  3 Feb 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081873; cv=fail; b=LEwvv8NlnW2rwape2sMalwgyotyKj9lSVqeLvCbMEVcD6ME0I8lE7hmUoK131sOucLho4awr/+bnHm7IKcLm/n6d/lzeg3RfeipfBSrckJQDoBgtsztDAbG6Y5TRXAmn2fBG3mxuNuY7mSgL+cYCWZmep1bsLmE3OxGFtLonIQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081873; c=relaxed/simple;
	bh=a80MACTBNUJnOWPeLxNSKVjbKYDOalhdsYzeI9x7hiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qspqpiqMZNZJ8IpSSXTZ49HRUH70hyK1Y1Pa/GvydO3sBnZ4YyWcun3X0KWTpXUgujJYzvboXABiZW8oJpzqmeVLn+5xUv/HQU5QaU83GuGu54mwC+Ht/UYoMQExAm9EiHJmeMnoOZuZAdHnYLCSAqKJInSU69QbZFi9/DwCi8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ufEbXr0r; arc=fail smtp.client-ip=52.101.61.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiUNCdClYllYcd2C/Jylo9M/lp7U7HiaFLu6oXemY2nmH78K+QR/mZsD8pEeQpP2BnsFOYY8eOnZzwnnipV63ajHzY9UQ+4CuaIeB5+paeVKKzvFpV6h6wUHstB547ZzUsz0SPKZQc+ufKjqHpl2RaCargz5B+Fn7e7A9Uf2hEersCa5/L7NeJrhj1UwX38E7/wRBFIME9516A4Zsm9EmgVsVlBz73K8GGlkhp/KiK3yPZak+5EUva6uEBLJOA9+gA8WEd5bGnPR/Fqf1uZOUIdGtnwtqSquBmSGQ6juFWOfQa8jYuJy+Pd96FI0NTtmfOH2M80z2RLvnmSUKr34zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSroCpt4Kkd8jxj5FQpDRGgsbaEvoy6x/9SJTcDSjNE=;
 b=l89BCqM2BP+cyT1gDg+0BVgnTyb2NMEY1etENaG2JeI5Hy+PITHrApJu+eXbt3wlE+n+e2uRwHPYEvRpH7fgdEBiyn2Iic/VFxkwsomJkqH2OlTw6S8HvrqvtMtht/Mu0d8K3e/708599DK0eeoaOsD2yi50xknB9hVbY9VfJ4Tie13R3qG6u3MV7I8rB8Pmcp10e9gIArJjPKBoUrzMPYBTMfPDhslVUyIR4KlEeVgzuuGT5Le96pZcwb2u+kLwulYUxiXC5HwXlUK+7gxXPj+mGesmj4s+Gf56QPyeXy8iUCTu8zxPsO8RyCE4KZoj/i/SnGkVf+ejEbiWdNt2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSroCpt4Kkd8jxj5FQpDRGgsbaEvoy6x/9SJTcDSjNE=;
 b=ufEbXr0r2AOAq1/JX7McH97c0vQOBFvLWuEP61055ywXR4/spKy8MTrp4hjFSbKmnh7o45ONW99XLPJG3Kz9JBSSGkqf/R18mItTE8ubkvqsLTccn9niFNnUpPBBpXwQR6SwLe6X3UhuMIpwxWN/UYJNrUW8yEcFNGE6Fl7/Zvc=
Received: from PH8PR20CA0023.namprd20.prod.outlook.com (2603:10b6:510:23c::29)
 by DS3PR10MB997726.namprd10.prod.outlook.com (2603:10b6:8:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:24:29 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::a1) by PH8PR20CA0023.outlook.office365.com
 (2603:10b6:510:23c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 01:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:24:28 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:24:24 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:24:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:24:24 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131OOor2681220;
	Mon, 2 Feb 2026 19:24:24 -0600
Message-ID: <70663059-fd91-4061-9c36-00c1b98d5df4@ti.com>
Date: Mon, 2 Feb 2026 19:24:24 -0600
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add reaction control to RTI watchdog
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260203011939.1013322-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260203011939.1013322-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DS3PR10MB997726:EE_
X-MS-Office365-Filtering-Correlation-Id: 612cf8e9-1d21-4ace-0682-08de62c2f9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tm92Q2hNVktvejl2YUpqZGNuSXZvaHRabUhLMUtWT3NtNUh3QWF6Y1BYMHFX?=
 =?utf-8?B?RUJaTGIwTVpMbEFkQ0xBS3RrR1FNTmM3VUVSaEFtbmk1OTFaMTFFeVU5T1hv?=
 =?utf-8?B?aXByOUxMYzRwZ2xQbFJ6allvcGtBa1NlSUJ6TmpCZjN0UGxHazErajVsNHVW?=
 =?utf-8?B?cFpyQUpZOGhjcXl6VWQwc1BTVlhsV05lK1dZNkxOTm9sQnpJdlc2VDdIS2lE?=
 =?utf-8?B?ZlRHWEZoQmlwL29uS0hNb05aUzAxUUI4UGxFQm02cVpzV05lZFZNZWVmSGdq?=
 =?utf-8?B?RVF0Q1B1MlRySmZyK2hWZjJQNTI1Rk1HTitKVzF6ZGczMlNFWjVWMTNjTXNs?=
 =?utf-8?B?NGxvNmV6aVhRazJiSGd5L1VtUGRCVFNLTWR4T0xpa3plRWFmNUFTdUp5SjhF?=
 =?utf-8?B?MmYySHFLTUh5ZVJwM3VaOW44N1kwWW51eXlZcnovSHV3YW82RitvdVFrVTQz?=
 =?utf-8?B?Y1VZVUtpTkpDbzU1Nzd1ZWMvZTFWcHNab0lsR29HL1ozZVlabnNEaXhJa3hK?=
 =?utf-8?B?dHd3NklHbkVrZzJBcmNxU3Y1Um5KRzhTbkhGY3BKRTgwbDdjTythQnVFRlVm?=
 =?utf-8?B?QmFxVTJneWhzZlUyNkhxdnVueE41dmFFQ3JyekhGdEw1Tk9XMER1dGcwWGty?=
 =?utf-8?B?d01SbzJ3YURRT2lyRFBxZWdyek1vZEVXeit0Y0pxRC9Jb055TFVYbFcrRTND?=
 =?utf-8?B?MFdpZGFSN284ajI0VjcvZHl1cHZWSFFGa1lFSGVjQUNLTThvdk9sN1MxNUtt?=
 =?utf-8?B?NTlNQUVqaFJxWXhyM3FTQVgvVVR5Y09KNVZWZkNBZkl2c052eVZjaG9Lc0Ir?=
 =?utf-8?B?d3l0NXVTT3l2eTNZNGFaY3Roam4ybEdyZ3ZkUU9zRGtZK1Q4VVhCT09xU2Z4?=
 =?utf-8?B?V3h2R0xkY3Z0OExmV2ZzM2d5N2duZHc2eHAxWnFFenVOSjZjOExMelNBZzBH?=
 =?utf-8?B?NEZvMDdld3Vpa3A0Si9MODdmaDlkZWloM21keCtkR1ljVUpDay8rL1pUa2Rk?=
 =?utf-8?B?RXZxQkdncWNWVEJoTVZaOFhiamw4K3FEU1AwdWE3cFMza3NHWTUxeXpSeXZy?=
 =?utf-8?B?eXh2b0JDMkZPQ0VocWhCNmtiTlVZMUFSeWdNSktkT1VyUC9VV3lNc3pTT0Zy?=
 =?utf-8?B?NG1EQ3VyekRDeXM2dDlFN1Q0OStTYW02bmVPZVUxS2lZM3c1WmQ3aWhNRTg1?=
 =?utf-8?B?a1Rxem5HZ3RBbnZyQWRvVVJkdG5GQ1A3eUtFS2orRVBSQUNrbnNJbGpBOWFF?=
 =?utf-8?B?R3lhcWhQSGRNTXRLcVVrQU1IK0toeUF4RjhwR05NZXRVems3M1VlSjg0d3Zp?=
 =?utf-8?B?Um10SmFGWis4N2w0U1JBaFFXK2NDbmxqaXVtZ2ZpeWs4MlR6cWl4L3dSeW5T?=
 =?utf-8?B?ZGNDZlk3bnQxb3BtUFBUV2lIVHRRTEJYN1JyMXlvWjZtaFluZHdaVTZrY0xh?=
 =?utf-8?B?S0pIRmlPTUVwYzczYmZkbFdUV0N3YU9HT1pyaXMySTAzTDV2WkxGSHo2QzVX?=
 =?utf-8?B?aG1raUlCMGg0bkVQL1pIdW42azFXdmRCSFFKL0Qxclo3Z0phazBiRUJ4ZktU?=
 =?utf-8?B?OFpaYnh5VFgweXBpS3pmSFIyTVBDOVlZeDB1Mm01MU5udGluR0grM081QUU3?=
 =?utf-8?B?VGJzZFhjRlJlOTNqb1RCWC9NSGp4TzNnQVkrNlAxT2IvTitaSi9rUkJUa3F6?=
 =?utf-8?B?Qm9kSlduVFFyTFZwKzZtQzJUTHgwNytTc3FvcUU5aS9mY3JtSytzNHQ2dmdQ?=
 =?utf-8?B?ejZQWWhnc25OQ2pzRWVGUVZ4Y0JHUTZYWEw5c0RQS2ZoWlYrdy9iWHF1NUs3?=
 =?utf-8?B?WXRxNFhBYUpFeU04ZE4vc3oyNHZCWm0rUklPOHluQjcyY0VLZFJCU2lMdTJi?=
 =?utf-8?B?N204NWNVRWJIa2s0cU9uRUg1SzU3ZXBJeVV6TTlEMU9SMUxCUmcwcENkTlhp?=
 =?utf-8?B?clRvS3o1bTBEMW9tNFRqaEkwOGM4WVRXbER0TGNaV0NGY09iOHI5UDNjbWdp?=
 =?utf-8?B?N3ZZWGtDT3hCajlhbXVWemNZUnJEdHVDQWNhemR1c3oweXF4OG52UUR2WGFi?=
 =?utf-8?B?R0kxYUFqNjBCYVg4NGhQMTREa0V1a1RGSkEveU9oN2FPdktpZEhTNHNFcFNU?=
 =?utf-8?B?L0ZiY2YxK1lYTndZaHhrOFV4TG55ZmVDeGw0dExHRzBTdkVqd0xnYzNJc3Ay?=
 =?utf-8?B?V0lXcEk3ZHBTUldqemZLMEx0dm9TSjRqVGtFdE5TQmI3VnRqMGxYMWtvREtX?=
 =?utf-8?B?akFXaDlIVURMVG0vNXd4REpMTU5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KiMWvaVjcvrp91vxfKzvedaX42naNmE1p9SUWjMdtup4D0xa4rLvHAGZ2bSgBkiVcdpJXsSMGzwwsLgKwrnp0z3b37D2x5YWaQJnZsv3Pfrtb8tZNt+M2N7zMrhVYFGqBRYl1VGCYVwfCH3SQo7x+6hgt1+lCWg4MO6oEDk8VmE8tcbcH5lag+u4FdblMMm65AtHrdYKhoBDyrznVm/5zw3z2DU6sw7rJU8o9455gCpuJ3Q7xUZxd7Glh0UxwJmQ8ywkgc2ADQgH5LCxuSiBuFC7iXxSKp8wIR6M8YFUtffAJppv6/Hc8Bg0PAEYhWt6LqYgrbE7idd/SLboVp8iE5/UPgihJuvvhkHjxhHW7jgFYCclMEUXyg18E+H6PHuKryvQhXJbWPJHVsMrM5ghIBojW3yvqq5NnhVvpUnorq3oD5UaNDAUX2Zp0gqrh2rs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:24:28.3764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 612cf8e9-1d21-4ace-0682-08de62c2f9a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4875-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:mid,ti.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B0278D359F
X-Rspamd-Action: no action

Hi all,

On 2/2/26 7:19 PM, Judith Mendez wrote:
> On most K3 SoC's, watchdog reset output is routed to an ESM module
> which can subsequently route the signal to safety master or SoC reset.
> On AM62L [0], the watchdog reset output is routed to the SoC HW reset
> block.
> 
> This series adds the reacton control to RTI, configures reset reaction
> for am62l_wdt and adds a new ti,am62l-rti-wdt compatible to be used for
> AM62L SoC [0].
> 

So sorry, please ignore this series, I sent the wrong version.

~ Judith

