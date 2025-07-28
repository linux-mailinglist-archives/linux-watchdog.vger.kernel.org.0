Return-Path: <linux-watchdog+bounces-3911-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A83B13A23
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 13:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56FB71661BA
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 11:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAED25F980;
	Mon, 28 Jul 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="i5AsfJMT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022074.outbound.protection.outlook.com [40.107.75.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429CC218858;
	Mon, 28 Jul 2025 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753703903; cv=fail; b=izUDeyOCt8sS0zx5OF4aN/0j8/U4sQ5NDH1rzPhziJZqYWqv6XH04TPCi8TU2LNoc38FOWhAhACtAV9aAVmO8hNGRVU/j8UFywEr22ITC3CBCxag33Qk0AlRVcQv3O1PBGVBf426+mOFHXQmJuriRl28XVbFJprrvYAuWiry3GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753703903; c=relaxed/simple;
	bh=9bagioqw0TNGP6aUZsn4PuqEiidfOC2s7GfFRc0mi94=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YiR6FThayALgr3WLnG+6ni5ax4AIqxPPzqKMPPtAcwVG79TdYVPlCrLdlHwgDQC4icy0q0W18zhOUbE/k7TBO/U5TOjstFY9L8pGeDkB4BmyrE1/Fc69zYRwemWWPQht4rL1oXKCY0XHZxZYpAE7mkiAfO2Aiz65XZJjvVLBhL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=i5AsfJMT; arc=fail smtp.client-ip=40.107.75.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEL3ujCVXPUN3LEZvJ7Z+ZtiFEt0L+fvmFuOSgHoLVBmPlzK1SPvHdmZZzXD70lLdGGsghqkTwm352grdKxjuB90A0j4Ces4bJVizuVH/L89xRXUudurOvdAV+jew4PdObKNtCFyKDZz0hG1CaAw8MW4uZJa83B167JdeyWs8be0GaY8+5x9j3XMawkxqvonYFYFLwQmeRF+UmDioH+UZThOqBgGI4nqLhYCgz7mgiZQfIfUKZXNFMYiT6SVC7DxlQaQ+SAst410BlYPbJDQ6xM02NvMcb0/cBcM/RsKM2nybkOkuBz5DrGp3yubzzAKOM4EohG+yMsIzhHJfK7dcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nldBf2ncwR59IW38adkeLZp65XirctkfhA5W75HzgNw=;
 b=FExflv2S+SXEog37vTNrFyRNPXeGF/CPdpbfjEl9oJhkQhgoULtEFTMELt0ytmz5Ha9SYHRUlYRz9x2W8AIbrUv2sFY8RB8EgmgH+8si+0+QwJeRCq1QQ6X++bBky/vI471UP2UgGgSWOO8ehGRUsnMx3i2xiJwnEkxnQOiNjlzt9eVFYQPAmSEWqBAaqb098D1NTs4kWfufJVp29DNYFeMR9pDht4hyMQOJac0NwR9PODU70frckbVIoKmEVHesTKyyYXuXrZKn613ggAlhLZzwTl85De0m3YHX25grh21Lr4gwPa8QMpeK63Ht56oKQqplc5UTUvEAytoRsCGXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nldBf2ncwR59IW38adkeLZp65XirctkfhA5W75HzgNw=;
 b=i5AsfJMT5bfvft0++PQ7vW2EvP6V+y9w3AKcK8+l7oNeZwUQ/BpsODLsoTHnozLxxmfGQ95BsLrhIr4VcOnIs6jMgDLk7meorkZqcKZlH5KheVl7w8rTxSSgIsgwqnwcHcsg4JD1Kejo/0+hAEnzdAgjzUD+5dYoPPd3Sw0yCyaCqI6iS6KIWidSWUnOfrQXyiniZCFKXsL5nU4mWLyqV6jidolMiaESkm0+UkxxzWzEt1u5MngurBqTXJII3uhamYXubEg+vBq4feO+nxWwpCwPHhdp3InMlaMGKFAkDAeIRWSYhMFP6VGNRyvh6ckNj4xoJSRhg8TdwXstIrKWaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SE3PR06MB8108.apcprd06.prod.outlook.com (2603:1096:101:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 11:58:18 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 11:58:18 +0000
Message-ID: <e11e542b-b630-4f18-8a60-a36fe31c0133@portwell.com.tw>
Date: Mon, 28 Jul 2025 19:58:14 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v3 1/2] platform/x86: portwell-ec: Add suspend/resume support
 for watchdog
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0049.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::13) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SE3PR06MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf46942-7aa3-41c0-2cd0-08ddcdce0aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGVkOGxweDk3NkRFK1FGYWdvUXV4QW5Hckg4ZkJBZXZtc0lqL2lTNWdJdWxE?=
 =?utf-8?B?UWc5L0NnMFMxZVN5S2pqZ1VybXFPQ3I5d2liRkJkb000VHRvM1c0cGF2NTNB?=
 =?utf-8?B?ckpPanZMOXBneDRSM1pIaU9ib05Rcll1RkJ5V0hyT0U4Q3VVZHJhMjd0ZmUz?=
 =?utf-8?B?YjVlRWtEUm1mWU1iRHdZYXRuWXNtNU51MGNDdkRSWW1wMHZqYWdMOXJZYmJW?=
 =?utf-8?B?RVFyNXZkY09PMDFwSkZHclEycWZOSXRsQXpBQWVlUnU0cHUyNUx2TXoybUVO?=
 =?utf-8?B?L2kwbTdGb3NkVnBUcFdGMk40ekZnYjhNOUJ1TWFyVzA1WS90aFVaZURQckMw?=
 =?utf-8?B?ZmN1UjdUa1lvamFUTmVubVkxRVE3ZGRBc0RDc3dGUU5JaVE3TTRlL1FydnZm?=
 =?utf-8?B?VVlqUXJhQmJ4ZC9ybThBaGdJc1kvbE1obDNFa1cyb0d3c2EwamNSRFArcGt6?=
 =?utf-8?B?aHloNDY4UFh2TmhkTktSK2QxTUtFYUYrOC9UcC9CT2ZPaTBYSGtlZ1VGSm81?=
 =?utf-8?B?azdtWjFaOWdVUFQzY2dwWENiYzE5RzJKMVpVV2JWc2IwcER2NnZwbXZkOUhw?=
 =?utf-8?B?WFRBT2Z3YVUvWTI1aXZncXhhNno1WGpNR1RxT0M2eFBwZ0tNZi9vbXN6dkZu?=
 =?utf-8?B?STVjcTg3SDFxS3FHeTNDMkdkRlRXenllRGljMVJJSlFmcjIxZ254OVhXUFJO?=
 =?utf-8?B?QzFUMFFjUkNzME5BcGd4aW53ODcxNW5hQ216ZWg2ZVI5aHRKSi9lOGtycDZR?=
 =?utf-8?B?Vzd6MzBiNFY3T2ZzbmkrOVJiTUE3cWw3eW5XWitnbGNhcm14VVFGbXVWM2NB?=
 =?utf-8?B?bHBLZkk5NEJaM0orTWVxeTJ3eUJQcU1SU2xyMGZqYmRCSk0rTGFFV0FhaC9y?=
 =?utf-8?B?M3YvN2V6aDBBVFdjcHhwR0w3bGdTK0VTRTVPUFdnRGhITjJmZjFFNHpaT2wy?=
 =?utf-8?B?cUVBYW9hREI3MVF0V3ZzU3BLcmJUYW1ndG56QXpaUThLRW0wRnljTzdaaWQv?=
 =?utf-8?B?eTFZUTg0QVlUSkZmcU9xcmQ5Uk5RUEtZaGVxYmlxS0Zhek03eXZQTjVjdW0r?=
 =?utf-8?B?YXRaNkFqNUJ3N1NYUkRRRW5NRFc0YkZoMWgyWjd0TnB0dGNvUkRxcmNKelZX?=
 =?utf-8?B?NlVYcHp2dUJ5M0NSZUtwQk5BVGJ4aXQ4RCswSU40cmFpZEEzM01WN2ZCN1lt?=
 =?utf-8?B?RFNKay83bkx6dmNCZkticm1qUGNNTzEvVlRYU2c5TmRhYk04Rm9yRU90RjJK?=
 =?utf-8?B?MEV0S1ExbXBVbDVrNjBaOGhVbCtUTlFVN0ZjdjRqQWhBWm1aSFpia1JYYnNy?=
 =?utf-8?B?bjdvOHZTOGlrTTVIbm95ZzdkZFYvYndFM1loWVZTUG1jZ3lScDFkUU41SWlE?=
 =?utf-8?B?S2FjbUJZTjRpWCtkbGFGZGM5SE5sM2p0S1NWNTFQM0dpNTZCWHZQbnRJeXNv?=
 =?utf-8?B?WVU1MFNUYXRqeC9hOXdyNGtYck1RK0x5YUR0bEY4QmJJdm93YmxlYVF0clZF?=
 =?utf-8?B?cCt1V2RWT0gydG8xY3JHdlBldkQvNmpKYjdkTlJUdWFsc0ZLelgxc3ovVkY3?=
 =?utf-8?B?TlZSaUNNT3AvMU1GUWFYTlBVT3lUMVV1SGlhYTRzWlFHNDlvVTkyUHM2eG8v?=
 =?utf-8?B?L1Q0MWpqYjd5czc1YzBzWmdrdCtBTFBuUVFHNW9YMTJlNTFkMEFhYW9RMVNu?=
 =?utf-8?B?cGt6RVd6bmdyTEFaVnNCaE15MU9ueGxJd3ZRbmZxc1c3WVg1d3lnclQyVVBl?=
 =?utf-8?B?QVFQd1BYOTFLRWVTOURIZFdTRkh1dG9VNXp5VkVEdmVwMURuL2UxOXFYSUFu?=
 =?utf-8?B?Qk1EKzl1VWgvSzFEY3NOa05qeHNrYjRETGNkU1BVeGFOL1dEczFITkdaRWRM?=
 =?utf-8?B?VHFUS3VONWRYVkJWSmNRUk1YQ0xvOU0rOTluOGQyclNlZ2h3SjdMa1dGVGU3?=
 =?utf-8?Q?PE/sWLHxI8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjgwbC9YbExkUkJ4MXNFK2hhenpna0FQSUI5S0ZNc0N0bTJvUUhtQnEvMnh5?=
 =?utf-8?B?M0pTTXV2TzVWMlY2V1ZuKzk2bVBWZ3duM3hTTGxLdWQ3bXBzNGNmaHFKblda?=
 =?utf-8?B?eWlZVEhhalloMHY3YlZ5ZFhhRHFBUUxRL2d5UkVza3puYTlOZTZCTHNnZDBT?=
 =?utf-8?B?RzF0QTF5aElGUHNUZENnOElqVHNpeTJORjUvN1I2cjlSRzVlTHRjODl2MUl2?=
 =?utf-8?B?THFDZno0Y2swM216dDBNeTh5d2hlcDRhcitnRVpacDVxWjhKZVBETFQ3b1ZF?=
 =?utf-8?B?K0ZJVURLampwcVVTVGdmY2hZejdtcm9TUkhJMFJIanVPYjdlV3RNSWtuYW1w?=
 =?utf-8?B?RjFUQlpHODJEcVFlNHUzaTZxNGpyRTlWb0VNZWkvbElCc1FiQXFiMWtSM2xI?=
 =?utf-8?B?RWZyOHp5UTQ4Mi9nTC9sdHpRVHorZ05kL0lCU3F4V3hNSzlOM1o3eERpWWRT?=
 =?utf-8?B?Z0o4UWZVYTcwOW1xdkh5N3VMV01zcGJTMHBkLzBoV09PUzVVTXJhWFF1Ynhs?=
 =?utf-8?B?RDFDWkNwa2Uvd1VXMWl2bjRjYXlMbUM0bEtDNWliMEVTVVNES3RWT2UzdlVi?=
 =?utf-8?B?RzVDQ1VPS0NBWU8wZFA4WENLUVF4dFE5Q2NKSEoxVWZyS05Nb2Npd1pPRUJM?=
 =?utf-8?B?UHBGMWkyK01Yc25uRzhMak9iWlN0UVFnSjdqMUpqUnRmeDZ0KzduY0YvdDlD?=
 =?utf-8?B?OUs0WUlWanZOTnV3cENLc3pucUFaa1g2OUQybzhOSWZhSUdXWGFNZkZhdHpa?=
 =?utf-8?B?Vkl0VEYvQ0xTSEQzcGNTOVdzM21ZeW5vVUIxNlJHNmRTUEZpYjM3T3FYanBm?=
 =?utf-8?B?T3NIcjJ6cUIyQ1VtdzlvMUtPL1lDQ3R0UWZkUHB2N2hVMVdDYzcrWFhza0Zx?=
 =?utf-8?B?bUZPT2d4M0d0dEh0VVF3RzJwaXRTTE5Oa2tYd204K2c0MlpnaU1sMFJyVDMx?=
 =?utf-8?B?Z1dkMzBHLzRlQVBMNElWeU1JYWNjVm5ESmY4SENwbzdPR0ZUbi93VFprQzVH?=
 =?utf-8?B?TkNKNUhrUzY0cEk4cmJwS0J6aE1kd0s5T2R5dzdwTTUwc0kvUXFNMUdYK0Rp?=
 =?utf-8?B?c2RhNGJxNm9BRU5CV3FvKzhUampFNmFCTWJsaDNVbUcxNDZIamtld0w3MjRS?=
 =?utf-8?B?TEh5WVorTFJ6NkVnZ283TW1WdVB5bVVERmNzMUZSRHNkSVhoT290TGlIQlZI?=
 =?utf-8?B?UnRFb3dDZ09JSjBZMVE0a1ZYZDQvUWNrOXhQSjFrZUNEc25jUDhiZm9MdThK?=
 =?utf-8?B?KytOSXJKSUhKb2NMdXI1anFVT2N0cFNlYzY4bEZKZWxvSHRkQ3gwdGhZaHBK?=
 =?utf-8?B?QXFUR3Z4aTBRdSt2MDFRWnZjbkpCbHZtM2x0ZkNWUUZRaE1yRndiSXVYanFL?=
 =?utf-8?B?UUJSMXV1MFB2d2UxYWoyTVE1MVIyL0V5c3JDc0wvT2twRFNHVCtzUG94L1gx?=
 =?utf-8?B?YWRpdm0rU0tKOGNoL2lLR2dRR3U1QWtCYjBVSGhjdFNpTlJJeUJOdFBGTUk0?=
 =?utf-8?B?YnFJdDR2SHFyU2lnRWV6QjdWM1RQL3ovWEJJNGxKOU83ZkRqTVRic0syTW1h?=
 =?utf-8?B?NXhzQStveFB5VFk5YWdKUHF3aUVuSU0yeXMwMWxHcGZRV0J0N1lUU01zWkkw?=
 =?utf-8?B?bW53emVEQmFzek5xQU1VV0N0WUIvcTRmZld4L2tHSkR2WEQ3aEsydjNoNC9N?=
 =?utf-8?B?aU1CQkU1YjZOcXBDUi9RYnJSNVJkZWtJdXdza3k3SXBUUWhGWXdER0RDdmpq?=
 =?utf-8?B?bDJSZmlPQXMwdCtReVE4UGx3dWwzb1hURklmbERzWDlTZkd4b2ZRc2t0Q2RO?=
 =?utf-8?B?V0svdTNrcVRSaWlUdFJFQzlKbGlBMWdQVFZTaC93LzRjV1J5S2JxNzNNaXhT?=
 =?utf-8?B?dGRwLzBnSm90ampZdTk1bU16VCtFYTlBd015Q2NlbUllTEc4bVgrS2NJckNJ?=
 =?utf-8?B?RytFL1pjK2NMR0lSU2JoQ0FJY0lIcFArc0J4UTdpM2lZMzZrY1ZvTUFWcHBU?=
 =?utf-8?B?dWlRem9nT3FQbTFWQ2Z1ZTIwQXdOSTJFSk15a2djcGFKR0xsZk9rL2I4cFJl?=
 =?utf-8?B?bTBEUDMvNTd4aG1WZ1NRc1Rhdm52eERROEJ3YkhZSkkwdndYSkM2RXp6Skho?=
 =?utf-8?B?ZmJvaE9ESHA5T1U5b1gzcGlNWHFqYytiSW9Tako0OENmVzFFTXZDb1FBdUxI?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf46942-7aa3-41c0-2cd0-08ddcdce0aa1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 11:58:18.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPpHMoYGKY/jQa8aZXRnV4aT2wz5ZWudEeChMP3kSHDQJL8oukMPi7Faoo3jlIW2RlZ7la7gQQ2TjrYe6GrGxjlV64HpFcVq4RqzkZ7GxOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8108

Portwell EC does not disable the watchdog during suspend. To avoid unwanted
resets, this patch adds suspend and resume callbacks (pwec_suspend() and
pwec_resume()) to the driver.

The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
it was active before suspend.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 3e019c51913e..7f473e3032e2 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -246,11 +246,29 @@ static int pwec_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int pwec_suspend(struct platform_device *pdev, pm_message_t message)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_stop(&ec_wdt_dev);
+
+	return 0;
+}
+
+static int pwec_resume(struct platform_device *pdev)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_start(&ec_wdt_dev);
+
+	return 0;
+}
+
 static struct platform_driver pwec_driver = {
 	.driver = {
 		.name = "portwell-ec",
 	},
 	.probe = pwec_probe,
+	.suspend = pm_ptr(pwec_suspend),
+	.resume = pm_ptr(pwec_resume),
 };
 
 static struct platform_device *pwec_dev;
-- 
2.34.1

