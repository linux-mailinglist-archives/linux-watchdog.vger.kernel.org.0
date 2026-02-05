Return-Path: <linux-watchdog+bounces-4905-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOxeHwHqg2nEvgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4905-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 05 Feb 2026 01:53:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BEED806
	for <lists+linux-watchdog@lfdr.de>; Thu, 05 Feb 2026 01:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C83FE3013ECF
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Feb 2026 00:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B727E192B75;
	Thu,  5 Feb 2026 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v43iu6uG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B893EBF1B;
	Thu,  5 Feb 2026 00:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770252798; cv=fail; b=J7HkZUUXPeaJRQDCTAsaqC3Iwt6VBB0+phv2Lf0xl1dF5tY3EJSgi2yW18pucH4796kfzNG4Yk6nsLaam3S9kZfqN1me10q9FHiDD43RJoABGVuRWahPCDNCP0GegmLuZ/0DZYyvWYBx2YiHk54/ogucCcvrHUY8fJnTUz/QPps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770252798; c=relaxed/simple;
	bh=Q/WWwL0+j4bgWg1Ra6sQQ0pF8O30lljzkxg7hyrvArI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hkeshY8PQJFxG5CEESbDtu634SuOSO+JanuQyahQLJraOXx25qxOz6tfmhWzir3rgOWUvue+YsqOTDtTXLrSczK61K/dW3jr/PlBWDDOZLuQlmntFFUYIKTfUAuC4kQP3aThPD+4ZB7MfAO+2VRXC6//Gh7CJjFXwvKBKzB/+V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v43iu6uG; arc=fail smtp.client-ip=40.93.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVmBQeaDp5Uvy7VDepuXWhjoUQFWQ43TfHiUv7+oyZp+UMUqIE+1TA1K6LP4h1t0WUvhps/VatHMCWDaMhi8ACYAgTu3gu/siz12+kLB6FwSDQfg/qkuv+qbE/Q99+Ue4dm5Ae5kojed9zdgi0ERb28td26XvZMC9a2RXSns3FzRAozIHYWP8rcLryNi1mcSAD6/rh/VXXjrZxhjdD+xtlXhEqtX+foUOtEg2tYrsMV+NEh7spto/E2EePI3MDiuWUmckAL566n+Yra8VYcgStcWRmMWKZGrq0azsQfzAejUJMlayzQ1md5Ffz5tCkgXelrZ5T11W3L4ou8q33Vh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0Em7Mow974gk0Mxx/soyAwkkB8uHdMDKpkjzz9udnk=;
 b=M09jl4LgkprgybK3hEBYRLwwrhUjSMS+7PLpGtaMVJB67g+TEIlT62GgwyEFblpE9xLR/N1iBI+PGC77/HuVI1oijonaYmxtW7N5voaBzDsTG20r1KUAJLDjVdEARF7hCFOAlODArLz5wPzEy1rDRMETfw1ESPysR7JWyuD4HbqlEsDvi2KD7w+/lnAt+x1kEVqVdW8yttHALMgOeVdpE+C/o/PABl1Nqwq5f0/nDw3Jv4PwsS1OS6knqoO8GkS3SjspkJBoMyrzlZcljzF1A1bpZDYT4taEbLFaGSXS1m/zI6eoOjy3b9vNWabHi8mHWbDwoo5GfWX69zprUwefhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0Em7Mow974gk0Mxx/soyAwkkB8uHdMDKpkjzz9udnk=;
 b=v43iu6uGhXkpLEdReSUbvWd/HgMr8duU2ccG3acwbu4PWBOMQvZ5idh4AwHBqwBA1g454OoES2EjPB/YLve06HHlN9KWU9stlzBz92tgqWpd+sSDb2jwxMqrO8DH29UFGfwJDtFmkHfaIiZ8RsENYEnq2eo6TvJRTFSVCltR8LU=
Received: from BY3PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:39a::9)
 by DM3PPF76BAA8D48.namprd10.prod.outlook.com (2603:10b6:f:fc00::c31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 00:53:16 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::d4) by BY3PR03CA0004.outlook.office365.com
 (2603:10b6:a03:39a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Thu,
 5 Feb 2026 00:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 00:53:15 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 18:53:15 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 18:53:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 18:53:14 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6150rE4p2045475;
	Wed, 4 Feb 2026 18:53:14 -0600
Message-ID: <77209fae-75de-466f-a4be-79a99a029b60@ti.com>
Date: Wed, 4 Feb 2026 18:53:14 -0600
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/2] watchdog: rti_wdt: Add reaction control
To: Andrew Davis <afd@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260203181931.1496723-1-jm@ti.com>
 <20260203181931.1496723-3-jm@ti.com>
 <8af0bb91-bca8-4c62-ae9b-a4eb91223a2e@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <8af0bb91-bca8-4c62-ae9b-a4eb91223a2e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DM3PPF76BAA8D48:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bdffcb-6aed-448d-c472-08de6450f240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3pFSVZ3b2VjZndXaGxxUzdZWW1kK2Njb0VwUHY0ZTh2TTNOdlRrbFJGQ2lS?=
 =?utf-8?B?YkpkM2c1SnFqT1VBaFY2TXlGVkl6VmxwVk85UmxNY3FwWS9WRVMxOG5ML3JB?=
 =?utf-8?B?dmdrWTdQRjY1Mmw5V2lFY2FQdVBpZjlTTmhwQU9MQk9nOHM2aXY1YkdGZldP?=
 =?utf-8?B?VVFCQzhPQjJiNXVkWFQydWdJZVhkQkgyVDlNL2JCK0NRUFlaaStZWmMxcXFL?=
 =?utf-8?B?MlJFMHhqNkRkN0xHRHRJZzFlN1poYnBOc2E5eUJUSmFZQ3RWVit2NUpSekdB?=
 =?utf-8?B?SnpoQU5ieE5XTWp5UDVvNDhrQlF2aCs3SFNlcVZtSU14ZU1vZUVhUDBZTUd4?=
 =?utf-8?B?Q3dkdjNBR2QvMGtvN09GWWQ1L0ZZWHdidUVRZU9vT2JGSmFZdXUvN3NuWDVx?=
 =?utf-8?B?cG9FSUN5ekJXR2V3VjQ1dERqWVIrRHdXaDJiRW1EVHp3RTg2TkttMUQrdmZn?=
 =?utf-8?B?b3BmM29mQ01CdHVWbUVvRUZMWjBCbjFwWndDMFhheHp1YVVTVW5WR1lTbVhk?=
 =?utf-8?B?cFVmU1pPcDNiRllxcmRkdkVQNzlHYlZrSVRITTloUUxvMkFIc2RVZUJzSHlv?=
 =?utf-8?B?Yms3SnpBdnQycE5WREo1WjZmL2ozVjFjZ0RnOFJnd2ZwZ2pQK3VObE9VVVZ1?=
 =?utf-8?B?RkhJMTB3cXlpeEcvSWNFOFhBODhYeElSblZnWGFNTnEvbUlybUljOHEvTlRm?=
 =?utf-8?B?blRJZGk4K0M1RjFSV2tydm5ZNzlkYnIwYWt6UVF1SldvUXdRbjFDcDlHSHIr?=
 =?utf-8?B?YVBRZk1lTjV5NXF6Q0dHWXZ5T3RkM0RRd3RURUN6em1CakZTTFc5RmVIY1ZR?=
 =?utf-8?B?QlhMbDNlcW1IVEZlYXFKdXJHaFZ2UnlPckJqRVE5TjhhQ0Y5d0ZzeWpsTkE2?=
 =?utf-8?B?NEExS2VWZTdBLzV4UWMvY09ibXZFU1crM1M4c1ZnZjE2QnBMMWhldytIN3ls?=
 =?utf-8?B?S2p1SlZ2R3N4NUYwMUdTS1hNd1diMTU1NDFEdDZRNjhZVmc3OEpxT0loTXps?=
 =?utf-8?B?WWw5OFFZNWhEc2VjSVhkdDhBRGJ4dDg0NUc4SkdZN0dkck9wTmVRSkZaMlNq?=
 =?utf-8?B?WWQyWURZNjdFRG10VHJlYzNDZnNpUE5IMVlhczVGU21uTUhDeG05UzUzalpN?=
 =?utf-8?B?Q09yZlBWY0h1ZE1WYWRlNkg3OUk5MUFEL0RDSzRDRko3MmVaMWhxb3p0TEtq?=
 =?utf-8?B?Qy9RbjRXdktxSDNIenJSYlJYd2wyTmNpNmRBMUI3UmFvRFFaZjMrOTY2SHZV?=
 =?utf-8?B?SFNxdHlHbEtYMzRwSlhrV1RPa0ZteFAwR1hwUm02blpYS1Fxd2l1NWhFNU9z?=
 =?utf-8?B?VENwZmVUVE12RUFwekh1Smk3MjJsYkVNNm15YzlFV0lsUDFGN0Z3bzhxQTgv?=
 =?utf-8?B?QWhKSW8zMzZUSFE0eUUxbWQ3RWEyTUtRMEhqbFBoSGQ5aWJHcW04MndkVkhl?=
 =?utf-8?B?WTNvMEhYUVhNYXk5VlRveU1XbnAxWDBkMVFQMkMrNmJBVWg4bG9BRjkvU2dM?=
 =?utf-8?B?MGRJSisyWi9Dc3VCb2R2MGlhenhlUXl6QTRMcWxBVlVwcEtoUkFsd3I1UXBM?=
 =?utf-8?B?MndURmZESUlDMVlHRnI1QzNHa0hkaTR3cS9hbEcyUnptS0J4bnd1UitQSHhL?=
 =?utf-8?B?bk5jejhXMFg1anJNU1V2M2dhNzEvYnZZS1ZIVUFVYkVaVmxGR3NQaVRKblJk?=
 =?utf-8?B?R08yM2ZzK3RBclA3VkhtMkh4MjhvSHZyWDIrWExWdTlZczFIcklyRXllQml6?=
 =?utf-8?B?ZVBYWktMbW1mVDIvL0I3UkY1VjBzVWRrVlc5ZWQrZ1lkS1pWMVNjc3FXMmV2?=
 =?utf-8?B?S1AxdjNkK20yYURaaDVocWFrWllCZ0tpbFZzTFcyT3N3TndRWU85REZQOVR0?=
 =?utf-8?B?aUkrQ3FJRExKWFlUT2N0S01DUVJnZWxBeUlEZVA3WXNVZzFKakRJTDNWRjVm?=
 =?utf-8?B?NmlENTVVdFppYWROUTBPeTFYL3cremU1cVcwbDN5anowNkRkSk8xL0JjKzBZ?=
 =?utf-8?B?alpBMXVtVnVGUWhhS3JNWG5NQ0F1LzFIZ2dsRlRHTjZZMTBWWkZPUEkzcjBR?=
 =?utf-8?B?MFZrVE4xeUZWR2ZRWVJEeExhTjFNZ2QrNzZmTmFvNkhSRkJsZ2ZBMFZaNjc5?=
 =?utf-8?B?SkFvaFMyYUVhVUZDOUdEWkdxSWMxdDJqczdIUzFlQ1hwemhyck5xOThBeDZV?=
 =?utf-8?B?L3NEdjJhZGw5TWNFWkhMRWliOHphR1phaWlBcVBVR2lLKzZBalhNemtZYnhK?=
 =?utf-8?B?SzRzdlF0bWdPYVlrZENFdDN2SHBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TnfjAve1A4v931uAM+x9XfpZ/BwqTUKnjuRu/yUP8HfapOWeIjl+lV7i+IrRS9di7UTn7AuFcVgqTVsZvJ1ANrsS0BUvYLFJSkSqcNxjdA83sUPIZkNls+60In0Gwk+7hsUMlOZmwQBi3EujbCQbovzYLQZlgzowvpNR7UpjI0G35HMFwPkWWWg6tEVSJKtMSltLF5QX0OL4jC8JDxUTli8lzxFR5XrRNh2m9iHVdearew6/ZL/xIULhkimIbd0zkillEozoRBkr88VMTGC59Tbq8F+frRcHuMIky99KS0q0YoqxHo2ZgczSVNGQRhnCynoIzca+Izxu49V3YtLf+6yNBMtveyKPdMfKdxUl7bvX0E9wJ8y5bgdfKIBIw4pBkMG8WhAElSYr+WStbQv77eAkBigK0ZpULIbc5M934XTD2xYvX5eWmhAuStzRg4us
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 00:53:15.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bdffcb-6aed-448d-c472-08de6450f240
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF76BAA8D48
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
	TAGGED_FROM(0.00)[bounces-4905-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E41BEED806
X-Rspamd-Action: no action

Hi Andrew,

On 2/3/26 1:13 PM, Andrew Davis wrote:
> On 2/3/26 12:19 PM, Judith Mendez wrote:
>> This allows to configure reaction between NMI and reset for WWD.
>>
>> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
>> to the ESM module which can subsequently route the signal to safety
>> master or SoC reset. On AM62L, the watchdog reset output is routed
>> to the SoC HW reset block. So, add a new compatible for AM62l to add
>> SoC data and configure reaction to reset instead of NMI.
>>
>> [0] https://www.ti.com/product/AM62L
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>>   1 file changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index be7d7db475911..483e22efedf9b 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -35,7 +35,8 @@
>>   #define RTIWWDRXCTRL    0xa4
>>   #define RTIWWDSIZECTRL    0xa8
>> -#define RTIWWDRX_NMI    0xa
>> +#define RTIWWDRXN_RST    0x5
>> +#define RTIWWDRXN_NMI    0xa
>>   #define RTIWWDSIZE_50P        0x50
>>   #define RTIWWDSIZE_25P        0x500
>> @@ -63,22 +64,29 @@
>>   static int heartbeat;
>> +struct rti_wdt_data {
>> +    bool nmi;
>> +};
>> +
>>   /*
>>    * struct to hold data for each WDT device
>>    * @base - base io address of WD device
>>    * @freq - source clock frequency of WDT
>>    * @wdd  - hold watchdog device as is in WDT core
>> + * @data - hold configuration data
>>    */
>>   struct rti_wdt_device {
>>       void __iomem        *base;
>>       unsigned long        freq;
>>       struct watchdog_device    wdd;
>> +    const struct rti_wdt_data *data;
> 
> Don't store the whole device match data struct, just store the
> information you need, so
> 
> * @nmi - Set to true if this WDT instance supports generating NMI
> bool nmi;
> 
>>   };
>>   static int rti_wdt_start(struct watchdog_device *wdd)
>>   {
>>       u32 timer_margin;
>>       struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +    u8 reaction;
>>       int ret;
>>       ret = pm_runtime_resume_and_get(wdd->parent);
>> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device 
>> *wdd)
>>        */
>>       wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>> -    /* Generate NMI when wdt expires */
>> -    writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>> +    /* Reset device if wdt serviced outside of window or generate NMI 
>> if available */
> 
> I think where we had issues before was this comment, it should match the 
> code
> and it can do so while being very similar to the comment as it was before:
> 
> /* When WDT expires, generate an NMI or reset the device if NMI is not 
> supported */

oops, sorry, will fix... again

> 
>> +    if (wdt->data->nmi)
>> +        reaction = RTIWWDRXN_NMI;
>> +    else
>> +        reaction = RTIWWDRXN_RST;
>> +
>> +    writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
>>       /* Open window size 50%; this is the largest window size 
>> available */
>>       writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
>> @@ -254,6 +267,8 @@ static int rti_wdt_probe(struct platform_device 
>> *pdev)
>>       wdd->timeout = DEFAULT_HEARTBEAT;
>>       wdd->parent = dev;
>> +    wdt->data = device_get_match_data(dev);
> 
> Should be rare, but this can fail to find match data so you should
> check for NULL here. Then as above, just extract out the data you
> need (nmi).
> 

Thanks for reviewing!
I will fix accordingly and respin the series.

~ Judith



