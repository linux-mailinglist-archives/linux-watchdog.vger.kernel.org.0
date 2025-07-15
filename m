Return-Path: <linux-watchdog+bounces-3873-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B2B04F93
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jul 2025 05:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F343B0A3E
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jul 2025 03:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41AC250C18;
	Tue, 15 Jul 2025 03:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="Hhe3lPdu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022089.outbound.protection.outlook.com [52.101.126.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF31B4F1F;
	Tue, 15 Jul 2025 03:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551786; cv=fail; b=jiLEB+3ry/gkCTv8GkR9FUQfO52Sz74aRPD6/4uTTVC0aYO107Vsz+e3bvhMfQjkvqmtayF2e4V3vsdIOmoTHpzvCiqWNiNw+/2VQOkL2qO3FbjGde+SRxz1xiGtu/BgIv+Iw+27Y1wwBvEQ4rkMDB7W1HnuGiL2eQSkiov73B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551786; c=relaxed/simple;
	bh=Rl1vCHRNPqTlYOz7c7ZlTEJB7I2NoR6WWk7weT9FSWM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y20QQndZOJgrSx3h4y4apP5Ufv3PFnvJz4y7UGCBLwg8Kv24xGtyM7kj4sBp3iytGLHHIuV7vTVf+s5i8IdSHUe+9SvTjnEsrvESULpNFlkvnv7rmfbENuFD4TQZQl9TESuTYvKe6n7yH88RL+w4WV6f1p0u1zBgh1w/gEtpUmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=Hhe3lPdu; arc=fail smtp.client-ip=52.101.126.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMnf30qipHJ8xXwE8hPw6xda9iTZgoEuOBnr5tZy56n+TeTIpnZXXD65QU/vgCe+gMcfw6JP7zBqGaJMpcAcmcd0FShtOD2cAy8rdyzj5GJFPgpjEeZolySjTWQxBWeAczEGYtZfJ5tZ4dYvZel94HnBQjo2hQc5VPMAwY72/S9S003dBF2dGv+eJjS1p82OA2zRSgXkDXB9kPbBjp1cqkh6ox8yUgmatrgBYo53VCx3zk3pUWXU/OtQn1fAkAdYnzuAnLpwp3ZcWWpGTMuxk3RK8Ob6LOyc8uioGbsKFzuh6lXXkkVK9H5sRIRyuZoAHq/YPZs+Nvgm2K7yySesPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k8sXYSdzdavwSBDc9839C9ZDhXvAZoZIIsZL5Ba+QM=;
 b=taJn/cazkflG+JbmEIb890f8/DG8nRzqg8qIPSw/16sbb7DS+fOdwFQrjiXGKGbhHvahbZaoE+waM+YjqkcfVK41fLrc8rzYmSFdGybbpeolEUSSmbBbyIVaCT/DGKQYYOXKvuLtTYj4l7a6rNPwHtuSsucdWeZb4X8z2jUaNduhYNgd9Iipy9zxQy9UpJXKZLaFGQLhlNWP0z0Flc5lpT6nY8tqFaLQLokvQADOasEitwnlc0agGws7bknkxWARBy2bFiFxSSAlT0lTSIsVY5sVU7RtcWjg5Bys4xSxF0/Whux09+XCWtVw+k9Tfa9ISZwI60pLo7hm+Jo561i+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k8sXYSdzdavwSBDc9839C9ZDhXvAZoZIIsZL5Ba+QM=;
 b=Hhe3lPduciVlpqR+OFMKrnhC8fk1qf1DC7F9w+821MMaphXdzIlctQPYUPzGcAfBb5/+/kMBaBWXq0QWKx+0ne0urhaQauA8KUKMf2gUYwGA46Vu1qWYaTTiJEDBtVAECamL2TicgBxwtl7MC6HYPLjoTlm2bE8RZ8WlEHjt0yc83HlbM7J45OtCvKKpJZRYhLvdeHRlXHMZMP3JQaad3fKS5hu2rmFFe1Cdhj/BgAD7206Unoa/fnSK0cW8it5drMLkUVym+qC6M0x98IEr43q4A+gnTjnV2Oegzh+N5Iq/wNDzCMvTDvjtWEIeW1PxhfROuyHBbHBeLq6WUt3O1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB6748.apcprd06.prod.outlook.com (2603:1096:400:464::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 03:56:21 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 03:56:21 +0000
Message-ID: <a961ba6f-4c4b-4f60-9804-2736a3d239d8@portwell.com.tw>
Date: Tue, 15 Jul 2025 11:56:18 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 062642b5-18cc-40ff-12a3-08ddc3538f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2JTNmZlSm1BTE95TEI4OHZWb0VqNXZNcjlFSEJxelEwS2pxOFN5a1Yzd0F5?=
 =?utf-8?B?eXJyUmJ0cE5KSG9Oc29Fa1daN0JTTmRZV2I5cDlIR1gxUlk5OW04dU9NU2JL?=
 =?utf-8?B?UGlKcjNyTXpSanJubXFLL3k3VWZXcjhEU01yMzFBOGNGSnIrTzI4Yjk3VWJX?=
 =?utf-8?B?cmE3QW1wV0pheEdJMVFPWWk3OGRQS0FEaGliVm03dzh3M2tRVHB3TVlrQVZK?=
 =?utf-8?B?b091RWNXY1lJeHBoS1R4K21IQXMzdVJTbGdoRG1oVHhBMnVpRmw1L1FTS3Iz?=
 =?utf-8?B?dHFRdXNYTDRpWno5cWNidHJ2UlhuQ2RDZ3Bja094WGlrMnJwQS9vSHNZM0dL?=
 =?utf-8?B?VHhEUDgwdjRZRGVVKzFoRVRyWTdwUitRRWFmTXRsNmFyaW01YTlUeE5KRUNB?=
 =?utf-8?B?V25tUng4eWJUUFI3NjdLWmhrZTJlSzdsbS9BVkhRT1MzLzg5WGpuSWNMeTZm?=
 =?utf-8?B?V1ppVEIvLzZiTStHMzh4WTZWUHE0dzB1dGMxNWtVdG1ud083dGNuUHc1KzZD?=
 =?utf-8?B?dmdYUnpXZ2xCY3UzeHBIYUFFM2pVTWN2SExpdnMzQStDaUt5akJyTElvRDg5?=
 =?utf-8?B?RkQxODdITThtRmVlUUdCRk1GMmJJakRFOFY2KzJST0tQS3NpRFpvdjdaUm1s?=
 =?utf-8?B?UU9EZnp5OTVka3FHZGgxZXZFSjJWeWZ2OGh3K2d3UjJHdlpnWXJvUkczaStD?=
 =?utf-8?B?WEs3QWJiRW1qdFJpOGNPNTBhZUhrN3MxSWM5YmxWc2FFalJjV3FnVVFCVnVj?=
 =?utf-8?B?QmN1TGZaZmtOSy8vVk9KT1RaZURvTmZTdk8rOWxPVEZ2SWI4cWoxamNvU3pu?=
 =?utf-8?B?dHArUWpLYkhUaEhCMHk3cm1adjRpMHNlcHNtT051N0dTaTl5d3dUUzRkaFpZ?=
 =?utf-8?B?UU9MS2h3RVNhU2o1c29USGwxMW8vcTNqUXNyeHFiamQyRnhJOEJHL3BKTGgz?=
 =?utf-8?B?ZjdIVmJQSnZiT2xJZGFGaVB5cVFaNUNwcVdlK0g0dFJJY0FhTHd2Nmh2eW04?=
 =?utf-8?B?bDhPb3dTcnY3K0sveVVTYVFreUlSV3BLNEpmQXkrOEdqeU4xVjBTN2pKa2p5?=
 =?utf-8?B?ZEIwcEZPSWdHRHMxbFNubm5SRDBITFcveHAzbVFOMUM3cHJIOXQ0K09WNUNM?=
 =?utf-8?B?NDFRYzRuaTgzcnR6cStDaEpleDVKSEpoUHYrWmhrNzNiaVVEMUoxVzFpMnlv?=
 =?utf-8?B?NTgvcEh2U2ppOGNpOVhTenVCQkZnck1FOGU5RHFhazRtb0x3RVNCOFhXM1Vy?=
 =?utf-8?B?c25Gcms4UGNXZWlsWm1mWXd0eDRYc3U5a3l6Nit0WUdwU08za085R2lGallz?=
 =?utf-8?B?RDU4MzNrMkVVMHJpMHhNWGhna1JYc0VScWhaTTFoM1Q4RjFtd1ZydnloWGdx?=
 =?utf-8?B?dGhLbWNmeXRHNDV1SEFHbVhqMUVRcVIrQis5V1phRWNzMjZaVWdEQk1jRnMx?=
 =?utf-8?B?QWhld29UeTVaREVwQXo0S1kvUmRyTDJ1TDIyMGg1ZFhtWUY1U3pvQ1QvWVhp?=
 =?utf-8?B?ZkF0cWFyL0ZBd2VwQlRTV1dhdC9RTis4QTJmTERKa0ZiQW4yVkpXNVpNL3Jv?=
 =?utf-8?B?NWpaWEI5QzhCVE5VL0hZUVFub0g3MDFvdWVRaXlrOW5FYlBPOVFNM2dLTmo4?=
 =?utf-8?B?bzNvZnVWKytNKzB6NEhCRXQwSGg5OEtHR3RwUGs3Y2J0VFZ4SGVQOXY1VGkv?=
 =?utf-8?B?c0xxTFMrSE14eXRvSEJFSko0UDlxSmZFWGJlYmxUaFZkTDB0MERRRDYxdzRB?=
 =?utf-8?B?YlgxOFUxUmIxQXAxbmpMaHpQUnZjU2NPZjRjb0xNK2MyczBPRTRGZHBPYlVh?=
 =?utf-8?B?dG9JZWhtdExMMTB6VDhXakY5S2ZJeEx4QmtyNHdJQjB0WWJkQWVMNDJGbWho?=
 =?utf-8?B?QXNKK1dHS0M5SWI0M0FPNEhRWDBIblZGSEFlS0hITXpxYnRMVUxZZGlhRVlX?=
 =?utf-8?Q?m89oGxxfj4I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJSU0hMdnJjdlQ4ZEFnSFd6UnRmSFZIZXpWVWhlL0M5TDFYTGxkWmVlejVS?=
 =?utf-8?B?b0VOYnllR1JzUGlIOWdqc2gvVW1mcCs2TWQyclcrT1JoaHBKMExwSlVmNlVF?=
 =?utf-8?B?NmwwOFRONG92TW5lRGlvU01KbnIxNnhlK2Fid3ppTHdqOXFOZ3lpWWw3cEFE?=
 =?utf-8?B?T2VNeTdjQk5vc1lqVnJJUU5wbEFzMFFSaTVITHZEbEU0aURvSy9lZ2dzandp?=
 =?utf-8?B?dEhheUdNRS9XLzJDOXFYRUx1UVpjb3cwbE9DR2F2OS9yQWdZSUZ1MDZBUXMy?=
 =?utf-8?B?Y2hDbnM2TkdrS3hpQjdSZ1ZzZFRMOUUvTFowcDkwR0Vab2RhY0dadzQxNDdl?=
 =?utf-8?B?aXkyOVN3ZjcyZXJ6Rml4NmlkVVVZRlVEQWRqZzJKTWUwQitpWjNYL25aM2JE?=
 =?utf-8?B?dlB0cXU4c3FoendTOUV2UXBNdzNFMzkycmFFOGszVWczOVRZdkRxM1BWVkcw?=
 =?utf-8?B?M0ZPczl1SGl0cDZpZks2aDl0dzdrWlRhYmRNU2JhMHl4UERqSms3bXh2c29U?=
 =?utf-8?B?cDZpbG95Nm1RWFBYY3hPQnhiZFhjcDl4VE5SVEhkc3F3dGJuOFRtMFBDays1?=
 =?utf-8?B?UFNZTnlSVlI2QmlZdDJWWjFXOFhuTGhQVUNaeVJudU11QngxQW81Z0F6THZM?=
 =?utf-8?B?bkNyQ3pwc2NMTlFqOGM4VUt3TmVnTXU0d3dzOHdENmxKMC9ETXltdjVPNEJ3?=
 =?utf-8?B?blBwVXlwcW1IRWVsOWpqc2h3NytRdDZNSGJVb2xjbHVCVnNhMkEvSXlyQThs?=
 =?utf-8?B?R0IrRUl2ajVvQnFnTHYxTW0vWXJNSlNaNXpBanZjT0M3cVpoY0hzT3lsdis0?=
 =?utf-8?B?YXU4ZHBkL1d2Y25iQ0k5M3hZVDYra2RxV25FUFN2UXdLbG83TVhLWCtmTC9D?=
 =?utf-8?B?MEJKMk95ekVqUjVqUHcxK1N3NzNaSXI3WHRmRVRCKzcyRmdFY3g2TFcrRmZl?=
 =?utf-8?B?WTkyRFJvcFV1RHVEMmVwZ3A1dTJmVkJVelRNMFcxR21uVHo5dW10YVl5NEwx?=
 =?utf-8?B?SWxLeXB2TXJsUG5jVW43VGpIZ1pDUDg3UWhKSVJJZEp4RFJPQ2xqcWxxVU1F?=
 =?utf-8?B?ZDhiekkyY3l5cnFqcXhidzE0UUw3b3kwamJ1Nk8zSFR4a1FWYWJ2NU1qbXBV?=
 =?utf-8?B?VVZxTjRhZnFkTG1TTEVTVTNOUG1Rc2dvZjdPK0hvYUR3dzFjM0JlTWV6VHg0?=
 =?utf-8?B?ZEM0VDVuY0cxaU9hSm5MYlllQzcrN0FjODJ6N0x1eHZ5amZOak1TUTlheEZr?=
 =?utf-8?B?d3kxdzJNbm5sdnM5US80czRJK1NvMTZIdytyVTdZendvQW5ndGZHTm9RcE56?=
 =?utf-8?B?M1pPZU5keGFIOEkwV0xiMytZeXNVVUsyakRCQWp2aGlzTEJxbjVabFU0aUJO?=
 =?utf-8?B?eEdvZG9UcWJBTmltM0l2UzJYNlBmWjNHWDd4YjZwaUNJUzRPbjJEUUUreTFW?=
 =?utf-8?B?bTlDbEQ5Ulp3ajdtWXVKMGtpck5zNVdrYklHRlNUTjQyMEVoZU9vVDQvQmtx?=
 =?utf-8?B?cW9MbVM4amlxNnRWWWFKc1J6U25vUEJyZXR1Zm53WVdIdHRZUkJ1VEpxWDE4?=
 =?utf-8?B?TCtMUktkQlFSUDgzK2xJRXlMUW5xY0pyc0FHZGVlL0NWZ1BiM25JbC9LdGZY?=
 =?utf-8?B?U2NGOWQxZVF0TklKbDFGbXU1L3hNRGtGVFRoVlhSZDIrYWkzTE1lb3F3ekkx?=
 =?utf-8?B?bkQxa0VVZllTbUZyNGwvR3Q4a1dSNjh6Ym01TjhCUmMwZ0YzN0dkQjUyT2pB?=
 =?utf-8?B?aDNvU1pDNTJBRkppZ25zWGthYXM3d0pWdWorWlQ2ejNBOUhHV3QwSTJxdWp0?=
 =?utf-8?B?SmhFU25wMExvaDZmbDJwb2h3MDFjR2h0RTdGOXl5T28wTWNJbFMyb2ZpZlEy?=
 =?utf-8?B?a0FNdm41b3RVNXZKNDVYbHVDcnBXZVFDdzFZN3BlSGhncExaSHVIeHRxNXk4?=
 =?utf-8?B?ZEt4MWpaY2xPeVhkbCtXS3ZDSFBQL2svak1rbkVMeTRuTXd0U09WeENhY05I?=
 =?utf-8?B?cjM4YThVMHV2b3ZXcnljdDhLQWp0V1pJZFYybVlraEJ1Rk1vNjJmV3FVdEVv?=
 =?utf-8?B?U0xyNGRKdUYzUTdDTFh6REJ3REphMEhhRmFWeWFyeldJQ3p0NWI2MzNaQjlE?=
 =?utf-8?B?d1NMSWV5dnk3YW9MSEZ6dTEzMVdjK1pYS0g3blpDb01qbXR0WEVNcnAvT1B4?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 062642b5-18cc-40ff-12a3-08ddc3538f77
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 03:56:21.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDnLmmVTAlpriA5+rnLzg6eitBMuvnnh/TsJA4k5uRCNJO9WFnlsfEA7EfhnXu2fIMyiNhA4qqiWz8Px+SLaM6YVqiGsF4qRSAzpcaXICTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6748

Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
monitoring into the driver via the hwmon subsystem, enabling
standardized reporting via tools like lm-sensors.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---

[Re-sending to fix message threading, no content changes since v2.]
---
 drivers/platform/x86/portwell-ec.c | 178 ++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index a68522aaa3fa..ac113aaf8bb0 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -25,6 +25,7 @@
 #include <linux/bitfield.h>
 #include <linux/dmi.h>
 #include <linux/gpio/driver.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -52,16 +53,64 @@
 #define PORTWELL_EC_FW_VENDOR_LENGTH     3
 #define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
 
+#define PORTWELL_EC_ADC_MAX              1023
+
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
 
+struct pwec_hwmon_data {
+	const char *label;
+	u8 lsb_reg;
+	u32 scale;
+};
+
+struct pwec_data {
+	const struct pwec_hwmon_data *hwmon_in_data;
+	int hwmon_in_num;
+	const struct pwec_hwmon_data *hwmon_temp_data;
+	int hwmon_temp_num;
+	const struct hwmon_channel_info * const *hwmon_info;
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
+	{ "Vcore", 0x20, 3000 },
+	{ "VDIMM", 0x32, 3000 },
+	{ "3.3V",  0x22, 6000 },
+	{ "5V",    0x24, 9600 },
+	{ "12V",   0x30, 19800 },
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
+	{ "System Temperature", 0x02, 0 },
+};
+
+static const struct hwmon_channel_info *pwec_nano_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct pwec_data pwec_board_data_nano = {
+	.hwmon_in_data = pwec_nano_hwmon_in,
+	.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
+	.hwmon_temp_data = pwec_nano_hwmon_temp,
+	.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
+	.hwmon_info = pwec_nano_hwmon_info
+};
+
 static const struct dmi_system_id pwec_dmi_table[] = {
 	{
 		.ident = "NANO-6064 series",
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
 		},
+		.driver_data = (void *)&pwec_board_data_nano,
 	},
 	{ }
 };
@@ -79,6 +128,19 @@ static u8 pwec_read(u8 address)
 	return inb(PORTWELL_EC_IOSPACE + address);
 }
 
+static u16 pwec_read16_stable(u8 lsb_reg)
+{
+	u8 lsb, msb, old_msb;
+
+	do {
+		old_msb = pwec_read(lsb_reg+1);
+		lsb = pwec_read(lsb_reg);
+		msb = pwec_read(lsb_reg+1);
+	} while (msb != old_msb);
+
+	return (msb << 8) | lsb;
+}
+
 /* GPIO functions */
 
 static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -204,6 +266,110 @@ static struct watchdog_device ec_wdt_dev = {
 	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
 };
 
+/* HWMON functions */
+
+static umode_t pwec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	const struct pwec_data *d = data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < d->hwmon_temp_num)
+			return 0444;
+		break;
+	case hwmon_in:
+		if (channel < d->hwmon_in_num)
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+	u16 tmp;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			tmp = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg);
+			*val = (data->hwmon_in_data[channel].scale * tmp) / PORTWELL_EC_ADC_MAX;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pwec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*str = data->hwmon_temp_data[channel].label;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			*str = data->hwmon_in_data[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops pwec_hwmon_ops = {
+	.is_visible = pwec_hwmon_is_visible,
+	.read = pwec_hwmon_read,
+	.read_string = pwec_hwmon_read_string,
+};
+
+static struct hwmon_chip_info pwec_chip_info = {
+	.ops = &pwec_hwmon_ops,
+};
+
+static int pwec_hwmon_init(struct device *dev)
+{
+	struct pwec_data *data = dev_get_platdata(dev);
+	void *hwmon;
+	int ret;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	pwec_chip_info.info = data->hwmon_info;
+	hwmon = devm_hwmon_device_register_with_info(dev, "portwell_ec", data, &pwec_chip_info,
+						     NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon);
+	if (ret)
+		dev_err(dev, "Failed to register hwmon_dev: %d\n", ret);
+
+	return ret;
+}
+
 static int pwec_firmware_vendor_check(void)
 {
 	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
@@ -242,6 +408,10 @@ static int pwec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = pwec_hwmon_init(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -274,11 +444,14 @@ static struct platform_device *pwec_dev;
 
 static int __init pwec_init(void)
 {
+	const struct dmi_system_id *match;
 	int ret;
 
-	if (!dmi_check_system(pwec_dmi_table)) {
+	match = dmi_first_match(pwec_dmi_table);
+	if (!match) {
 		if (!force)
 			return -ENODEV;
+		match = &pwec_dmi_table[0];
 		pr_warn("force load portwell-ec without DMI check\n");
 	}
 
@@ -286,7 +459,8 @@ static int __init pwec_init(void)
 	if (ret)
 		return ret;
 
-	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
+	pwec_dev = platform_device_register_data(NULL, "portwell-ec", -1, match->driver_data,
+						 sizeof(struct pwec_data));
 	if (IS_ERR(pwec_dev)) {
 		platform_driver_unregister(&pwec_driver);
 		return PTR_ERR(pwec_dev);
-- 
2.34.1

