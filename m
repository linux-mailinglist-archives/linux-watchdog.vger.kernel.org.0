Return-Path: <linux-watchdog+bounces-4073-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA4B39307
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Aug 2025 07:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363BF365404
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Aug 2025 05:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13032BAF9;
	Thu, 28 Aug 2025 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="lvK+UGmb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022113.outbound.protection.outlook.com [52.101.126.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016E111BF;
	Thu, 28 Aug 2025 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359088; cv=fail; b=Uj4nLvSEzAfyUTdaoJ93h8vj1tWd2JpZz4oGMvrRNTrl1ArPrtkbsaMktfb5YHMoq7zF47b+d5JrzOJ6a3d+LhYZiJK78+ro34iCJQ9GnKq9V+QY3gS4FqzZ1ZwzM0k0oKRu1kOpBE8NDdseMjQngVmycjvDunmlNaCwXnA39eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359088; c=relaxed/simple;
	bh=RFFrtMCLDsMzTb+/OE3rgjyiasbjeLutk9E3NizzqX0=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=sjt/hOexNlYLz4go+0oZAbnGUHEqbaoXnsY5O7rkUcuTZqDkHFk2/ZN10XHLAiy0dhNcKpSuu/Z/oRt5WGKgYtHEekb51IE8XKGl9uUkhkhG80ZJjeQA1ojdLM7Yy2QMbIN1XqnTvwlBRKCvtW87yt/1tl5gwkYPaillDWTaQ9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=lvK+UGmb; arc=fail smtp.client-ip=52.101.126.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx9+Kl+uYSBJ4drGRjAJ+uNiRpgd7ZuwjYIb02FRbXCSF/gx8JCi9iSmlzz6Q8ekRIzlKMf8B6hxLKo8pyUFHNpiyPzNJhqNz4SPGVR2NlINe/k1gHnhRtuk/ZL6zIwqfyGgvIf0mbxOAv+h1GZEP/e6HHp1+EGVLGLhf3qxhpoy7aEYjPa7BWRSUY4Ml9ruPYzWA+Bvanf7CfpdqNHHPj4eniDvsnE3fxZM8wXcoIBk313hV4Cd8cXua72kJE+QQiAqraxPcLgjxxOCZ4F0UP4U2K9PQ/WhiIXKwSdVs4VqMiLwESvM69WzfGPKJqIw7oSq+lM8Nwvg5KC0OsIP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvBFoF1TwUb2agwD3jHbaL4iQfBfMfgo9aHKTYlfl0A=;
 b=sS2VuR3fisfE7Ec7j1Zxk41euk9An9XBSgt5o6W27A33NdCpmXX2xCyRKdriOLwR3/eqK44nWHqTdRRfz02dNacEOW2a/GqFzQS9KHGCKd9G/Q41QQbBZQPQxDNHDY4dw65K3cYo010k/liAzp0Ub1YamsEL5K5fz6BGI15tTKOxf0BlBVh4seZxir/4QPG/xmx7kJ+VX6ub3AqKVcDmLyTSNB3bWdxbpa9YbzpuiqDvDtG4ZLW4IyF0KIIFnsm0mqa1jlVf9DBrixSNYC1YTLP38IOqTGpjEIHhV3ER7+7yArrYSvumhuJHNH0ZUf7/EjZ5OaWf4GmO+W3ebtzr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvBFoF1TwUb2agwD3jHbaL4iQfBfMfgo9aHKTYlfl0A=;
 b=lvK+UGmbanN5uDVvJLlgnaGCK8qDH3uttWBI/0FtpRp1QMfs6OvDdHTmbLaXg1xWS2cl1zxxO71VuD/QwOhQ6cXtvN47GeTrB+MvlpMjaSAfqckHE9uunoaJXhbCVodaEQoFgZ7s59Emg2KS3V+JXhtWRbYl1bA+D33+UmtD2AaAXI8wjvhCndrSwuucZDvHH4S7ZmtkFp7NWbFaXJunaAcQIhQUN64jVo08/kOUzkI/lTn41BfNklSo/uHfoeYoF//l/1pa+f9ocqIfJ57De9nmE/vuKiWQaeBkNXJ4uGQ1raYph+tJNPuY2HmM6IFj9kYG95hWgYky9RY7S3qASQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB6531.apcprd06.prod.outlook.com (2603:1096:101:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 05:31:22 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 05:31:21 +0000
Message-ID: <c9cfe602-c279-4aa4-9932-76f47f26556c@portwell.com.tw>
Date: Thu, 28 Aug 2025 13:31:17 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v4] platform/x86: portwell-ec: Add suspend/resume support for
 watchdog
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com,
 jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acf3aa0-3023-4452-aafd-08dde5f41ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDNOcXAvTHQvR3doM1BJYVNYRjhNdGh3L3JsZGQ1VHFrbG96dTJVZW9vbDlE?=
 =?utf-8?B?V0tKVk53eXJ2K3NHa0tJeEJRUkVDN1hMSGdVOW4zbGtjZDRyYTAzL2RZT0xo?=
 =?utf-8?B?cHNJVVZscC93NSszbmFNWVZBWlVXaStqTWNjem5VZW56eGRhaWI3NVpwdnVP?=
 =?utf-8?B?OHowUHRqSEVXM2Rma3EzTFJEdFl2MEY0ZlV2Rjg0cUJ5RDZ3ME1EMEE3Ynhr?=
 =?utf-8?B?cUdKTXBYV0srOUtUeUlEMTVxY1lteDVEZ1BveWpoL3Y3b3cxWFZGRk9JRmxH?=
 =?utf-8?B?OEpEeGcwdm5tKzhwQTNwQnRFcUU4cXBuRDlGYVR0TGcxYnhFVmhlelBwRGZs?=
 =?utf-8?B?OERzdDNXUktUc3JSN1F1TEl1NXVGQjk3UUtkMjhVM1oyb2lMaVRvMHUwRGJY?=
 =?utf-8?B?eFdhbS80eGlpRU5ncnRienErd3NQTERBVnNVQ0ZTT3ErTEdwalJGTk9CMFF3?=
 =?utf-8?B?N2dScHlEMDBwLzRvQXRHRGJObnRhR1NUY1QrdzQxWUkvWlFLbmJGK1hzVjRI?=
 =?utf-8?B?Y28vNzYvd05qRyt3dlJJb05xaGhialc5THlKcWdwdC9weVVDNU91NG84M0hE?=
 =?utf-8?B?SDNSTWpzWHMzQTdvemFNVHNSaTNTQVN4ZVZ0dCtWSFhtTDdQV1R6aXZEU2gx?=
 =?utf-8?B?Q2h2Vk9Va1hoTVJyNGIraDNySkhyQUlnZzloY2FsT09lRE5KN3pCWFNobDkv?=
 =?utf-8?B?TUcyM2RxVnF4SFoxK3FKQ0JKMkJGSDB5MHl2MGNVaWJ3SjBWa2ZPRVJQNExx?=
 =?utf-8?B?bSt4N0lISHljS2FKbXkrQ0Rhd0svOVNKaDV2QldxemRpV0R4RlRsYmluYUx6?=
 =?utf-8?B?eU5STG9zdGZkZDhST1doNWJGbEt4dnRxQUZ3NHZ2aE5GWWJ6eVBQVkNBSXNH?=
 =?utf-8?B?VnFnKzQwVzB5V0RWYm5kMG9xWTFFV2k5eFdxQWlnRWZiOGQwZ1ptQksvam1S?=
 =?utf-8?B?Q3lCUjMwUUhlM3JkeEMybTl0UWpuNWdlQVJ2Sjc4dXJNVTVRUGJ6dUZ5QW41?=
 =?utf-8?B?aThJZTBCTjc4QlFTdDRUVG43cUNtTFpaZVA0bTFlRkZoZUVoWkYrbmRSMEM3?=
 =?utf-8?B?RWR1MjJoNlZHNm4rZERZM3JWSk5hT0d2eTEvVzgxWWsreGpqQSsrQWtOVGti?=
 =?utf-8?B?c1V0aDc3ZHlUaVFyelRNR01xeUR2T21lWkFiTmI3eGZsaFgzY3pGQmYxT0ti?=
 =?utf-8?B?NWlGTUJMK1hXdFNDWnE1UzlsZ2Zpb1drNUh1RmpaM1NvaCt3dUU2NEhSMk1t?=
 =?utf-8?B?YmMwSjRZUEl5ZEd0Qk53RzMxZmpQRUdjdXZiVVdEU0lnSVZUNVZyLzB0Zm5R?=
 =?utf-8?B?UU92cFBVVFJPd2tqcmZRb1ZYZ0wrekhzR2ZlNVcwK0x6a2N6M2UxVEltbSs5?=
 =?utf-8?B?MUVmWUdrb2FMbTdnSkY5TjJVejBaOXlDUDJpcFBRU2UvSXk4NEs5VmpUWDkw?=
 =?utf-8?B?NzMwZnNtYnUyT0RiQXFwaHZxNWZQdEcrb0NmSlRobU1hUktGa0dqNDlFMVh3?=
 =?utf-8?B?K2djZWl2dFY0MUo5MmYwNEIvbVZZcW4yMXJ0VUdSVEZ5SjQ3WEU0engxQ2hP?=
 =?utf-8?B?UmZCOGVuRTg1UStiLzlwb3kvTDdpYmNxMjJKZldva3MvVEFkMmgrZXp6eG5j?=
 =?utf-8?B?VmF6T2pOMVRUWTRTQ2dZYVhURXhYRkNkcWRiYWJUZ0xnQXltQ2ZzcTg1ck1S?=
 =?utf-8?B?NlhHbWRrN1hGSkNqSWdBWFIvUzBFUnRHU0R4ejJJMVhBSEFCdXhFOUYyY09n?=
 =?utf-8?B?QktNSERqcm9JSTNpTVdTWmwyTThLMDdnVVlQUjdWUFBqRExiMzRpcVp4QUlx?=
 =?utf-8?B?SXlnNlNnMm85dG0xQ3JVNTJhK0VoUWp5clV6ZXNyaEhkWCt1YmI2c0tPQi9w?=
 =?utf-8?B?bENqY0VZSmxYcTBNdzVvTVRhR1ZWUURkWGJkWDVuYWp5WDl5RXlud0tMcVl2?=
 =?utf-8?Q?SDMzk+brHeg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3Y4UEdkcUlPYmgwbWI3OXdvSVlSd0V0Wll5blVqWmt5RU5KdXZNMFdqbXk5?=
 =?utf-8?B?ZFRPYW53TUNaaCtMV1dJdVNER0tvN2FiVDBOR29USHRJaUc4cTg2enZDay91?=
 =?utf-8?B?RndrQ0lncE9FcmpLZGE1aktnWHFsZGNPY1RZbkFPc2c4Njh1MFg2RjBjc3Uy?=
 =?utf-8?B?bzdRV0ZkZjQwNDYrOGo0K2dxRG5OaXRFQzg4aStxMlVPWlpaQ29pWjN4c0JP?=
 =?utf-8?B?dXV2MElSNm40WlRhQjlBTlBkZ05PbHpOSEFmUHBoRXh0YURMUlhGZlNwdVpy?=
 =?utf-8?B?V3RYbjl4VDlJZGQwNXJYUFlid1VZbEpWS0VFR1Z3YUtJQVIrSHJLOU5jVWJz?=
 =?utf-8?B?WnVCcTJpR3pjYmR0MzJyQy9pNXQ0WHNScGM2eTI5bmtkTm13ZW1ob0Z0eEpB?=
 =?utf-8?B?VWhROUxoZ1JwTWlGMG5IZ1hUVyt1bDVNa3NkMXBPcFNlQUI1a3I3Vm1HaE9B?=
 =?utf-8?B?Y0pqNVVJZ1kwZ24yWnFMZm5sTXdpU01YN1dtWkJXSkNQaTZ1Y0tGenRnZmNO?=
 =?utf-8?B?NCsybFlDNUFkWGxiRkFySlFObHVOOG5NdngvV2w2TWRMcmxyL0ZwMlJabXdE?=
 =?utf-8?B?Ri9XQ0o1MDNsV2pWVE9SS3hZTmwxUVBlYW9tblpVQloxZ1o3MkY2eWRnMHFO?=
 =?utf-8?B?dHd6WGVET3pIeFZCVnEyZFcxbllBYkQ3U1dMbjRucDlodXMva0M0SzZCeXBN?=
 =?utf-8?B?bzh4QTJINWN2cmpGOG91eHJoODg1MzNYYVVjMm9ydk5XRGYrTmRLdlVlZmVX?=
 =?utf-8?B?WjQ2U0wxeEo0MVVMT1Baa0gvSDYwa0tzNEg4a0FiVWhURDIrK241eU9XUGRO?=
 =?utf-8?B?cnNqMTR6SjJudWVZd2FvSzI3eDlkUjBndWEvOWUvcnNpSWtaWG5ET1ljaS9z?=
 =?utf-8?B?NE1NZHppVC94MjdMUGxOSk96SkhVekNKRXpOMmhGc1ZFZWk3Tng3aSsyUjFK?=
 =?utf-8?B?MGs2d0VHZlBGdlF5dlZwTXJMbXNnckFacjdsVlBMeFdEdVMycXoyU3lyZ3N6?=
 =?utf-8?B?MGdkRDM0ZldSYlYrN09hQUlFMnpDSWtmU2tMRWhabThKMThkay9CQ2s4RWZo?=
 =?utf-8?B?dHdxenQzQVpBUXlNY0RNS200a3pkV0NyOGk4Y0Iwc2NnVWZvZXNvUitlckZp?=
 =?utf-8?B?VWxzSUJaQ2p3VWp4cW5XQWR4cnRqUm9tcUl6VmVuaWU3bmd2RitJTnZYT3Vm?=
 =?utf-8?B?TFlGYUMvdkVQOW8yM0Z3alBkQjcwMXFkRXY2TFBhNlk2Ukxtang5c2dYcC82?=
 =?utf-8?B?cFZFTk5wYVVYbXNPUUpuODhUQ3Q1dXVDcjlleE5JUmNaS2JWOUJEaUg2Y3Br?=
 =?utf-8?B?b2VPbVFlMEJQOEdRblRJdXVGNUVRNFJBWmZYZDAwM08xSmJRZWQ0NURlV0F3?=
 =?utf-8?B?RWRSWjdKVHcweEwzaENwQ3c1eG4vTkJKbjVSNnhsZ0pWK3JJUkJzSU5uOE5G?=
 =?utf-8?B?bHp4RzU3YnBsd0R3ZmEvTjQxd3BhdFhkK3Z3UldHeDZNOWVwMC96VFhkN0dF?=
 =?utf-8?B?QVpFbHZVc1lBZTNOYk40QjdxdysxMGQ0M1VyNXlSa1pJTTdZQXFpdDhZWXo0?=
 =?utf-8?B?cVF2OHBvS0ZBNWdpUmN2Ukd0NTgyY1dHdDdWcHNCRTViM2RRUlg1a25oWkQy?=
 =?utf-8?B?RVU1RE1rUWtJYm0zMXpHdG1GMGR5UzFCN01SSXpETmZ1ajRETU9HVUJCTWww?=
 =?utf-8?B?dk81U1hycDc2dVczdkEzRUp0ZDh0YXZ5RVgyVi9OaFNGR2xyeFl1RUo4Unl2?=
 =?utf-8?B?bXM5ems2c1Ywd0k5eFp5T1A0L1kwL1FUT05aQ1BFSGlVTmF2KzBoSXFybUtp?=
 =?utf-8?B?WWVpeEFIaXJheGhNWS9Wa0xEbXo4clp1SXJzZHI0cCtrVGVvOUgzL0dQdXZh?=
 =?utf-8?B?VzkrS0RrbCt3eUVFbkxURlc5WDNWaGIyVmg2M2tkdHAvbEhQdmlQQ010Rld2?=
 =?utf-8?B?cUM4VVZTT3BVbHp0NTQ0aEY1VWc3bWRoQkVrbzBsQmg4RE95SFBuVWREYmJo?=
 =?utf-8?B?d3dOUk9JUUoycGl3eHMwcUlRa0hrM0hKbzVaS2lOZkcycS9qWUpLS3NzcTVR?=
 =?utf-8?B?WkQrM09RekZqdHdsRWVVQmF4RDBwM1Y2SmlMb0pCTy93L0VKY2tsYnNnVzlr?=
 =?utf-8?B?SnBmZkZqaGI4Y1oxbUxPdFd0U25pU1RQUXlXZ0srQUcrVW0ySTJBRiszTUky?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acf3aa0-3023-4452-aafd-08dde5f41ee3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:31:21.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/+rIN8kp+V21e+aphT3J1R7l4K4KxyXDdcAXOYPYlmgbxoAR/j8DwZCovoTWUYhKAYgcim0osGACzU4Ue4JSjKasyedLQkHNKsvKFZyhbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6531

Portwell EC does not disable the watchdog during suspend. To avoid unwanted
resets, this patch adds suspend and resume callbacks (pwec_suspend() and
pwec_resume()) to the driver.

The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
it was active before suspend.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
V3->v4:
  - Switch from legacy .suspend/.resume callbacks to .pm with
    DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr(), as suggested by Ilpo.
---
 drivers/platform/x86/portwell-ec.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 322f296e9315..d2e91d5c3b3a 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -30,6 +30,7 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/sizes.h>
 #include <linux/string.h>
 #include <linux/watchdog.h>
@@ -246,9 +247,28 @@ static int pwec_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int pwec_suspend(struct device *dev)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_stop(&ec_wdt_dev);
+3
+	return 0;
+}
+
+static int pwec_resume(struct device *dev)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_start(&ec_wdt_dev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(pwec_dev_pm_ops, pwec_suspend, pwec_resume);
+
 static struct platform_driver pwec_driver = {
 	.driver = {
 		.name = "portwell-ec",
+		.pm = pm_sleep_ptr(&pwec_dev_pm_ops),
 	},
 	.probe = pwec_probe,
 };
-- 
2.34.1


