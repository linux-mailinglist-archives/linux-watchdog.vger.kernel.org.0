Return-Path: <linux-watchdog+bounces-4760-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E179CFD388
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2AE8310973E
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 10:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2DD32826F;
	Wed,  7 Jan 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="B1zcaeWm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9B326957;
	Wed,  7 Jan 2026 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781821; cv=fail; b=M92IcOYEdemd5S5htxtCHHVcsjsd5oXSZhSZ/Z9IVhjFlMFWDhIw0UPcien3DUvoLIh8TawUbvTrnh3tSDnZOlevihBk7NJWPaHpEP8PWS9+XWtzhVjiOw78tx8lDr4mBs+oYb4iHhU+WElM3USOOnBguHXPtHB0K/XX9owjGl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781821; c=relaxed/simple;
	bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPwN0catScTHq/ydWmDHBM0atXvnrzEAzlqT5HOrlpWJymIpTBXHeg7kMcNTsWulqirgGPRZCH2kkO9hHJolHRr4Koyq9EnYLzAR81fwB/P9UlPj9Ov962of31szGj2qUIskk7A3P7+mL/lqQ/aqEblegcXA2lqBsC+1ES7YNUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=B1zcaeWm; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4+GUfz6CHp5avTfzrl1TM5tkUzE31BvE55eNjTNojskCAfB+hRmh0As7e1j6+fpwsVX8DUpgciqc5SPhGvxUwlWg+zTS53okD11aNnL56ptDdn9hBYUXD37/4HrasyBVX3JRl8uGsNXop7Nhd2ynJogyvM10RaPA46P1aFR6A1x0tbkIcPB51SmCckjpzjS756Vp/SgoU57Pg3p5g6oyrmAoxlOvtW95Op7lK60BAfVvxRhTFkP27pEMkDcpOymNMmLfT1ILtF0kG5WzdbPrUgQUfu4V3EoVzPIN+/NbyBYPr2CzGNIgPgPfEvG994dogYks8XNVjs86hCqZklBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=JHmZngn5QkQ3Ao4CPLNcEVP27s55FOCWVl1LWfwTrIvyWGFVS3Nvv9XUxdm7NDIgStCchYnTLWXcXsK2NEQ0Ew8Wf65Tp3ln/NtmxFD0+7LW2Z+CLwJq+JIN+Wmo6hr45PUKDs0zL6mQlZx8nLIF3bPI8LYkIXEhTOYINdhbF3pPsW0LpwI0zvljWFWsao+NI1bXwT6WyoXnFDOWP5YUtUsip20attbGgupTgBY52sJBbr5Nf0qlP595CZHVcBC0QutNksmTcj41qR5d4lxnvO+TpxbL0kSsGcFE1Gofg9nkWtBw3+HwTOjWuXuWyzOFHvNh9LXfzQlWVfFslHebug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAEdqOeTx9GD9IpXPVNx3Rf69mgKp47GFhUtN8FSqos=;
 b=B1zcaeWm9mo878ncGDd1GO8dI3NcsaI4WdJij5sHUX0h/SmawAHaP8LUxjatFsgUSfWhXx4Yul7Ucsx9DtSLYXbZjHgK25y9eo0TTdjwjTI2ZaDrQ5IcFn8SjoQcvI9Qwx01OTZLYEHaWhPoWRYpB//+iN7ST2ccr242eZP4WcZA9yxVA8dVn5WMreCP2latRsxI65CVlXIsI6oClS7zj77TwStidqNWAVkxPr79N3mdM4Zp71o8EozP4sUFI8QV2Tsc1gh1fUpLBM5HWthZr3HHioYHWc5xSGJbo4FI4i74jSqQkXsVbgIIrTifE4YulvPqoTzUoPLVuQuBFuJwcQ==
Received: from MN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:52f::14)
 by CH4PR22MB5701.namprd22.prod.outlook.com (2603:10b6:610:230::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 10:30:16 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:52f:cafe::30) by MN0PR03CA0009.outlook.office365.com
 (2603:10b6:208:52f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 10:30:16 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1ADA3E57C8;
	Wed,  7 Jan 2026 12:30:13 +0200 (EET)
Message-ID: <9f77a920-0ddb-4918-bba1-816b37727d52@gehealthcare.com>
Date: Wed, 7 Jan 2026 12:29:57 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <aVz3Q34/nchMuqVX@shlinux89>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <aVz3Q34/nchMuqVX@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CH4PR22MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bdc9be-6310-4211-723e-08de4dd7bfc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVFSUHhiU1FYR1B5dkF3ZlAwbi9PL3NDUGNFekNhZjFSc2NlRGU4MGdLQlI1?=
 =?utf-8?B?RTVTb1YxQy82WlJIcEN6QWMvMFEraFpLYlBHSk83YzZVWWZDREk2YitneVU1?=
 =?utf-8?B?a1FkeUZ3RW84dDdFdEFtRkVOWmhvdjVZazFLN1J5czdQNTdtcVk4S2dMS21H?=
 =?utf-8?B?cG53RE5iUlVKS1VvSHdoNExqb3ZCZzN3UlFsMXIzQmJZMVpydnhGN052WElI?=
 =?utf-8?B?NnF1KytaZXdod3QwOTBkbVdlRUJtSGkxUzlxU255Yyt5elIzcEtVcGdRK3FQ?=
 =?utf-8?B?U3YyUWZRNUhpaXBVUmhIUWgyZU10T3pYL2NoV0Y3Y3poQ1F4OUJyWW5qaElI?=
 =?utf-8?B?M1pMd1hDQVl4OG15TmFiOTNZanZScFlGRUIvVnR1WmZHc1lzMkFqRndMd3Ni?=
 =?utf-8?B?b0VBNjdIb0w3UlM1MlBxaW91eDNyV3ozU3ZKa29uQnQraS9CWVlpQ29ab0Vi?=
 =?utf-8?B?L1VQbVczZEtZZkE2ZnIrVm9iTllQZGwxaVpXTjRxMDZjOU5ESHFSZU1mUDRj?=
 =?utf-8?B?eHRkeGpST2xUUEcvNnpkdEh4TjJ5V1FqcVZFVkZxQVloZ2UzN01ZUlVlWm85?=
 =?utf-8?B?OTNKbTBSL3AxZTNyZ2JFTW5aK3Qzc3gxOXNVTnlZRnpkeldTZ1NKbGNDVW4v?=
 =?utf-8?B?V0gyRW0rVTgrMWtrTE4zcTRuTXdKM0dEalhXRWl5aCt6d0tIcDI2ajNqbVQ5?=
 =?utf-8?B?RnE4cE1CeVZZN2Fod3NNZE1melFqTUZTR2QwTW1sVGZoYUs1YXRiT0tFS1gx?=
 =?utf-8?B?OWg2dVdqUzdPcmdmWlJFcXVNaVlMUk9sek5HT0FWNkdmUmcvU09aQUFxRUE4?=
 =?utf-8?B?RDQxSmNHYll5YU8zYUgrTTNEMjltWDJ4MXJ1U0YvSnNhWGZzYnA2UHBpZlZI?=
 =?utf-8?B?VEMvMWd4TGlSWVBLc0c2TnMxYThvMGlvV3MyTHcvcFE0RlBJR3lSckNMalBM?=
 =?utf-8?B?cG45VnlSMDBWV0xHR0V1anFSQ3M2MEoxcHJscTRUNlB6YnE2alloZjM2MExL?=
 =?utf-8?B?Uzdvcm5xd29LbkJtdEsrM1NvWkg1VFVFSldmdHZtUHVnQ1Q1bldjemJoQ1Z1?=
 =?utf-8?B?UG1Lam1zam9Pb2ljODVacHFXUmJlU2NsYTNxNVNsekNSWjkyMEVPckpxOXFO?=
 =?utf-8?B?Slprc3Q5aUNVMkNhMHVYZXdzZ2hhNS9RcHNXQStrcXpNL2U1TUgwVEZxbVJW?=
 =?utf-8?B?ZHdtdmhSWlo3WHVITzQvTzBSaEVZNzBkMlhYNmhDNHRLclJraVZVUHBQbXZJ?=
 =?utf-8?B?VGpKend2S1lmbjljL2lZWGYrR0RwSWZpM0hZemEzY2kvYk5YQW5LL0l0c1VO?=
 =?utf-8?B?TGFkTmNpbURzdFE0WGE4VER2WitJbW42WDJMUVN6Q2pCajVUYzhabmFxeGp2?=
 =?utf-8?B?L3l3b2FTRkR0TGsyUlVQUHNhZWFWTk9GdFRaVFNMTW50bzZOTmJmeXhSTnJV?=
 =?utf-8?B?SzFUOFlzbzdYRGFFZ09YT05JeGZuV2JTdHJNRk9RMnY0OXpiMExzbjdNTzZ5?=
 =?utf-8?B?Z0xKL2FrTjRQYlliMGZLUGVzd00reDE5K2F6eExobmhUd2Q5TElSOHNpQ0NH?=
 =?utf-8?B?UGluZXdla0F5a0ZQZkthd1psKzNYaEZDZjFIemd1NUpFd1psM01zc05zdVJr?=
 =?utf-8?B?Qy9veFhBelVSM1dVZ3lMMm1GL3plck8zQnZlNjFVQjNMODNudlJZYzRmRDEr?=
 =?utf-8?B?K1YzV2dLd25DM0ZxU1VkQzRYVmJSVDRSVWFWUElENkt5OHo4SlJCMHVsRWRa?=
 =?utf-8?B?UjhrTTZMUDRZS0FOL0hsQnlObG5DV250a2NFbEhKbVNpZWszeWlrOUdsUXRN?=
 =?utf-8?B?UzdVOElHSjAzbkhPSG0vT1RZb2VsYmR3MmRJdDJSK2xkVHRSTDE5VG1Dejds?=
 =?utf-8?B?NDVNdEx4TkRiYzdTbXNZZDZjSnRIcU03QkNvbnFrdWdrNXY0V1JtLzFsVFho?=
 =?utf-8?B?UWp4TzB2RTV4Um94WkpONHRtNmk2MUJpVW84MzhZdDUxYXRPSURsdCtrV3V5?=
 =?utf-8?B?ZnZYYzRkMlRPNjZLbWRhMTF3TXhFUDRGT0h5MjZQaDczVjFCTGwzRC8vanY4?=
 =?utf-8?B?YS9SdWcwNnhORHM1YmZDamxmYzJjYnpaSzZOckJuUGRNUkpaSzcwdEUreTFD?=
 =?utf-8?Q?M+8w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:30:16.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bdc9be-6310-4211-723e-08de4dd7bfc8
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR22MB5701


On 1/6/26 13:51, Peng Fan wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> Hi Nandor,
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> >From the cover letter, I see that system should reset if runs into
> low power mode. So your system are not allowed to run into low power mode.
>
> If my understanding is correct, DT property should not be used.
> You may need to use sysfs or module_parameter for your case.

Thanks Peng.

Yes, you're correct, our system should not run in low power mode.

My implementation is based on the fact that the driver provides already a Device Tree configuration for the WAIT low power mode.
To maintainconsistency, the patch simply extends support to configure the watchdog during STOP and DOZE power modes.

One important consideration is that the watchdog must be fully configured during boot to catch any potential issues early.
Since this is a hardware property of the watchdog, we considered that device tree is a good place for this configuration.

Regards,
Nandor




