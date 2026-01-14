Return-Path: <linux-watchdog+bounces-4815-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB57D1F0C6
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jan 2026 14:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A78AC300B377
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jan 2026 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A75F39B4A2;
	Wed, 14 Jan 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Vl1J4VYv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946BA397AA0;
	Wed, 14 Jan 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396992; cv=fail; b=Sl3Fu48WtlZKwYTB2XiXM9A/Ts4SjQ5qUdmqPB+47IAebZ8/gkNdYvD7tYjTi8CoVJeXaitX4nEh9AkySa/3QJUHFKZ02Z+aMAwGfRAO/x6L37AvXY2v9ZyIEttVnCQd5VAdm4RHq2BftlzrjwX/y9OeWTkzSeJBK5x1hV51bcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396992; c=relaxed/simple;
	bh=/ptWXPNeZGd6v5J3qxkxf/pbkPfmbXzeshzgo6wM18E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWlR4SFgk0DrM2K3Ji8m0G3MJnpn2Ecb5yCOqqsRNMFvJKZ4lyzOZdUCr9xEbDUEz9jcdELqQ93qImj0/1m2V3/6cA0Nu1HKuj1h3Q30PK/EWB5ttP5IMjMZ/aJxvGICo9R3HAPVeX3UAi4Z4Rkb/GoM15fo7BhuXCRLBAcectg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Vl1J4VYv; arc=fail smtp.client-ip=40.93.194.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAIiw+i1l4hZf7GxxCYlKQP9zWmCfNlIwBFf9MhQuwgd1HXs82xo3Bt5aqV2kqQSGjMdhaHUhJs1eAPb9loOBazLmiBUzqX3w+Si6ocOZRBAU85LN2oXc+r1BkrED7ickfjXKSu6kkQzIdSsMIaNCY2OOXq7xo+W+TZPSbZhLNmPYmj3rF75m7A/ZtNnuJR0OBK5T7/6D9tuHqkFdYvk6m9CESjQ8UtJCKhlhng5MPWxOWZJePqOCv/0S0xp1PDCnj6mox82c2CNhz8pc4RyZJpkVmDewp0fqkzIA5jtBDrBTV57wp0Dnrclcw3wkKwCX9yuPbSSaxQcTQIZGXsbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=QvlV0bcYoow6V3LUjIUnIoVqAeWHMKUoqHDWbpjyDCDVoZ49O/ksSJB8Vzu91aXuNz6nb/OXw8ccrRG6as66e5IDM7Q0E5pbDtJpKwqcLCSpL1vvV6sL85dgsO1WCMHstO/SKlvldSYIxbD+vfdNSsUmvqeCqZ/ivfXjn1HV8fCdvNGS1QDj1c3ue55GRL6ZLxZVw9AtRQpfy6Wwb6sC1jw33S0bWgnX+uyCokxK9DXfgkijFppPH7RQ8rT3EWO+CH18FC7TR45tkCSsd3iuPx2MZcngk1p9k++c1fw/KB2zEDlgaUKj5Ya0PdlPICu6iJ9q5h+hqciRLl4CY0ToOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=Vl1J4VYvmKlB4I54vqjEU35zcdaAZB1l6jRSQVUXJcMrfKyTi7ivDcfZu2WqDYaCLw8G+FxDDEaM4rnSfvDQlxSJZqxurXGaz6E6U/63VgNS1MbtW1o82EG93t5HfvyU7iUmSmMXH1Y9fvK02koy7px4Sg2DiALMuWvNSsTsiZJ5MnbXyBN9qnU9v3iKrmx4xjCecAV9toHsL047hu/2WQrtNGKNqXFdwjsfm29dM7J33CBl4c0/8bIRg1cJdHn9cJcQXNrO4mAY5QR89DzS7jJNIXji3XZG4idPfrJBddu5J+7aUf414mQ9L9hlLyo27rUWWccyApO5UN4Xr9JUDg==
Received: from BY5PR17CA0025.namprd17.prod.outlook.com (2603:10b6:a03:1b8::38)
 by LV1PR22MB5989.namprd22.prod.outlook.com (2603:10b6:408:2b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 13:23:05 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::23) by BY5PR17CA0025.outlook.office365.com
 (2603:10b6:a03:1b8::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 13:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 13:23:05 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 899EDE8F21;
	Wed, 14 Jan 2026 15:23:01 +0200 (EET)
Message-ID: <1359781c-a1cc-43ff-88e2-f381e8ab81d2@gehealthcare.com>
Date: Wed, 14 Jan 2026 15:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue
 in low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
 <20260112130849.3748465-2-nandor.han@gehealthcare.com>
 <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|LV1PR22MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: f2791667-e92d-4de9-f377-08de53700d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0paOXhSNHlodk9SQ21jWHU2enFJRWFSMVZPelMzZWNBR1hMQVdmMmdQL1Jq?=
 =?utf-8?B?YWd2TWVrVmszbVJiL05tUUUxSC90bXJsUHJKU1U5YmI1NldtWWpteTJsT2Uy?=
 =?utf-8?B?VlM4WGpYbW81UW5JL1Jld015WTBZcEQ5bjh5ZktqMHdmWm52QkcwaXJxN21y?=
 =?utf-8?B?eVM2LzltYVk2YkhFOFNEUFM0ak4vOUd1akxZV3N4WVFMd0lTblNMWVJTTEF0?=
 =?utf-8?B?NkhuSi9SYUxTZStSWUQxTkJ2WndHUkNLSStNdHFBWU4vcHppNzdhWkcwSlEr?=
 =?utf-8?B?QWZhNzV1aG9vbG5zMzkyTXZyOEVFOXFvOXVIME1QMkJQV2VCNTJZMm4xYzhM?=
 =?utf-8?B?aW13RnVIV3lKV1gwd1FXOCtzVzBUUXRNRElkQzBqTll5L0JLQXBsZ1puZSta?=
 =?utf-8?B?NnQrdlUxUmluNWpxenY5UWpqamcyb2pBby9lZE9rM1d2NnJGdmxtL3ltbGNu?=
 =?utf-8?B?aGhicGtnSlJrc21QOVZBc2VKam9iUHdxekZYdHppbnd6Qi9BL005M3VhcGg3?=
 =?utf-8?B?dUQ3dkxIcUxzSTNZVkNNNGdFbWlGM2VaRWVnOE40ZVVFZ2FEUk5MLy9YU3Rw?=
 =?utf-8?B?WGs3Ujd0TEViU2xTemEvTHNGdlh0cmZER3Bxb0pVQ0tGYkRyTzZsYUM1Snp6?=
 =?utf-8?B?STV0LzVndXpEUXIwZDI1YUpacGMyR01YTzlLRlFMOEFnTm9SRzZFbnNxZGE5?=
 =?utf-8?B?WE9pdU9QYjRvcnl0R2I5ZVU5SDEyVCtwR1FGSHlHZis4K05XeWpNRkxEOEN4?=
 =?utf-8?B?ZlJCclNPeEhqcm0yY3dxMHY1K1p3K3hWRCthRzVVU0JOTlMzcUwrblpuRUFU?=
 =?utf-8?B?dHlodU1adHVERXpXK0lqWkFUU3hqdFlzU05wYkUveU1VYlExUnhpamJpN2xp?=
 =?utf-8?B?UHJvREJkWnNKWFBucFYwSHMybjg4bVN4Y3BXWTZVd2tKZDBTWEFkUGd3ZlZa?=
 =?utf-8?B?alI5dWVVbWFjUUxCZ3N3RGlMUWJsd09Tbng4Z2tjSnNqTG5sNkx0SE4ycFNx?=
 =?utf-8?B?MGIrRGxjZzZBUVZXSDVKNXFybkFUSTF0YmFjL3pTTWZ4NlREY2ZmVE1mQ3I2?=
 =?utf-8?B?MGhlbWMxcUhZK0R0SDlzUU1taUx2cklLVzlNQXRSVnZ4a2d4TC9kNlEyK1o5?=
 =?utf-8?B?dHFBUDMyUlpxRi8wK09GbVYySzIydHpmTUVYQXJwbnZGbDVFMlliTzZsZGNK?=
 =?utf-8?B?a2JRNmx4OG05YVQydVplbDVtTDJHVVpJemRCRTI3QUV5bERUaUJyL1RyQ1Rn?=
 =?utf-8?B?cTRaT2I0bVY0bGgzUlBJM2J2dFFzWC9RM3UzM1FLSlBZZmpIVndaZ01QQStM?=
 =?utf-8?B?TXhFcE5kcTN3L2tRVmVDbzN0M2x0N243Nko1Yk5aZ3FhcnpsQjNqQkdPdFpU?=
 =?utf-8?B?dXNLOW0yRDdHc0FBMjRhQkhTN2RaQjVVN29EbUZ2NUMxNkE1MytJSWlDdVVY?=
 =?utf-8?B?TWlYZmtnbkNkdFZoMWNOUEJlYm94OUNlRndjVXk3WmFZb0tTd2FwdFJ2ZVdU?=
 =?utf-8?B?SU5rRFZKU3QveWFEcUlnMWQ0MHM4TlYrRExVTUxONmZPU2R4SXJpbk13UWJG?=
 =?utf-8?B?ZEZtUnpaVTJzTXNkOUZKckdUQm5OR0VjaDl3T2tNNUsrbCt6RmNvNUFWa2Nw?=
 =?utf-8?B?d2VFWlhLa1JvdVBpRWJuSS9VZmRlb3dHcGVwdUdWMUYwYnZlb2RRNXNpRGo1?=
 =?utf-8?B?bDlRMWNveVVORFdZdFQvV2tYTUt6TDMwVFE0aEc3ZlEvM3NsVFI0d25TTWpU?=
 =?utf-8?B?cjFwT3RrY1lDblk5M0F3OUoreGRPdUVJb3QzRWxhdXFzbnhadDl2MldyVW1T?=
 =?utf-8?B?YVlVditPdGtmR2h4amVLUmZhbUdUZUQvN0lsa1hYKzBaZFluWS8yRDJOUVd2?=
 =?utf-8?B?NkFUbGRvYkFNcU9SMFlNS3plcmdDNWxLbnZmYWVvUExyMDI3Y09kZkV6by95?=
 =?utf-8?B?QUNaSCsvdFRYc0Z0QW5mVGJlQ0YxN1pzejAwRktCb0VOWkJHZDEwLzVwY1JD?=
 =?utf-8?B?cElWZmQ0akR3NmpBbkdCcGlDN1lSQ1E0SUlGRmw5ZHdTa1FhWmlKQ1dvYmVi?=
 =?utf-8?B?RG9XblZVWHA4K2RNTjZYRWMxQUpRam5lSXRHbkx3ZUhaZ0lad2ZXcWt4ZFBJ?=
 =?utf-8?B?YzZHZG9QRjl4cDFmWll1K0hmT1owRitJMFFzZEthck9Cc1VXRlJUVVMwc0pM?=
 =?utf-8?B?T2VwT0JtVURlRnVzUEpKSFBMREx0Rk5WNWRzVFVBYWUzSG5HNmJBMGlMNno3?=
 =?utf-8?B?TGhoOFVraU0vRFNNMzRxNUVuckd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 13:23:05.0738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2791667-e92d-4de9-f377-08de53700d2b
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR22MB5989


On 1/12/26 15:55, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 12/01/2026 14:08, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
>>
>> Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Apologies, will not do that on the next version.


<snip>

>> +  fsl,wdt-continue-in-low-power:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
> Do not need '|' unless you need to preserve formatting.

Thanks, will update.

>> +      If present, the watchdog device continues to run in low power modes
>> +      (STOP and DOZE).
> Not much improved. My questions how this petting is suppose to work
> remain unanswered.
>
> Again, system load is really not relevant whether watchdog works or not
> in low power mode.

Our use case is that we do not allow the CPU (i.MX7) to enter low-power modes.

To enforce this, we explicitly enable the watchdog during low-power states so that if the system enters such a mode for any reason, the watchdog will reset the CPU.
Since in STOP and DOZE modes the CPU is halted and systemd can no longer service the watchdog, the watchdog will eventually trigger a reset.

Regards,
Nandor


