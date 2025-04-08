Return-Path: <linux-watchdog+bounces-3240-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025DA7FC28
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 12:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E3717307B
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A124267F79;
	Tue,  8 Apr 2025 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gRixDo71"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2C267F70;
	Tue,  8 Apr 2025 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108228; cv=fail; b=dgQpY/FMQ8txxGmZrRyJVRS3c/no5b+3uwQm8IbgmENXqeJr5bQ19ASFhn4ByCvvX477XXfzaoprsO5cAxpneQdCNY1cYQLg9VTN74SzP4sMz4ZQLXBbccj9pKxtYwKZqf3Tm9p60xS5w+RlDsnYfS+hJQZGc2JS18MkisUWkFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108228; c=relaxed/simple;
	bh=F/uhcM6n5P++TGC2S6+nlIG9BpP1tNaTQlo9mCUxL4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bS9sLEC15qBEypNiW7a+jJN773ILiBnCP0INfpEgYRE+rRvYtdHtNca9VQ4lqK2S/Yvpsj3sQRUXXZcqIZAWpZRmwnDXf+r+Q92dnKKON9Rt5yUluJbF6QeufVgMse19nwFU8cp7cJhdL8TsVAvo4xqxpd0m8k57/pWzlmUPYRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gRixDo71; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADYtvqFXPPsHfQzuPi/kBdYQRSQ2lZSeLOB6A4+HXBjLc/V9fQSJP6g1Ic1IxuuOCAKbQ6NBkHKlJmINenOyp0Xm4imE/Kg31SZ7H/dO5kCz9ir3wtAACipcUFwjTYLeVMO42AienMhsu+0xZqCDk7v62RBREeL/+oEjv9jywiqw5dY1Y1/tW6EEtRD6629tpGM6c8e0MHrpX7GQpNi5ceU+x4IbWs5UTIiWx1FAiz100IfVOQEkYap/KPt9g7qSw3vnshNg7WFEoB6+NBMICH+WsGTnGHMS4n+7FmHdOoaRwuXK6yMp3/7u9Fc2NjmivUMCa+tX53BfnhRa1ygzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eKJLfC/OZUymA8rTCQ3T1km5kOnGMXV/0z03gg5tOA=;
 b=Gz9B2kFT2Dbpwzrupp+vGafw1SwIUUr5e9GC3U08cYQLN9RUtE/zqMc5S9BP2LesxzNppKi3Mbgsio4bm9MNN/hMrhOENBOXYPLRNCM6fiK8m1JpFkWjorHyjQbkRolFmsSo9dfeG5w1qPqGJb9A7r6BNO3qSamt21+dUuc7lb06Ys/mLPksLZksk+QterF1WOG1CosEMYau3LOQkkU28nyREZ4W+0QFItzBSgQbwhg/lfi/M3cYxkkA4rydABD/hUk8j8m1wU7Vko7kXWj1p0X3PoGGh6yU3y03UR4dF05ks/qf9ywAy4gvQtA982w7eE2WVac/z1AAVwonA5Gp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eKJLfC/OZUymA8rTCQ3T1km5kOnGMXV/0z03gg5tOA=;
 b=gRixDo71ja0V9NfcDstMzyZbe3dAzEG3pHUpG5zPrBFUrtHtp76CxOhxBcTh6Jt0ZDGjbe+hxlk3iP53NjmgBsiGmprJiWGeKayAwZNc9mecXbwE89nTpsrTZi+SkSWjwhjBTEVDfuxkt7cjrs29w/rGGSJ3pipEl8SIkzgPpf6KptEB8fWCZm0MdBcCWwW8DkLQg9aOZhyZrUImx8Ci2hp5hyw00YFtiDGfop4z872GldUQgmj8f8w3Mvq2KlhulJwroQy2ulsIcgTZvELo00VFzQvBRjvSCnNXKglvGh3cNlTWhaxSt5UMTUa18wkQhr6kjzqrNEZ7MU3z1Y2Swg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:30:22 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%2]) with mapi id 15.20.8583.045; Tue, 8 Apr 2025
 10:30:22 +0000
Message-ID: <0ac343fe-e835-1c0d-55e7-5963cc24fc45@oss.nxp.com>
Date: Tue, 8 Apr 2025 13:30:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
 <20250407160318.936142-2-daniel.lezcano@linaro.org>
 <094855d6-a99b-4ca5-bc8f-ab6faccfd332@kernel.org>
 <1e3d9e34-133d-451c-9ce6-6c974a781305@linaro.org>
 <981498bb-70d8-4304-9b53-065576ae8dc7@kernel.org>
Content-Language: en-US
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <981498bb-70d8-4304-9b53-065576ae8dc7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::9) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f71de0-9c8f-46f7-7dc0-08dd76885db7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RksrV3VUU0psaEt3QjhWeitEMGJlUlI5YWpidWpiMDNQWGp3UFkxV05RbDFw?=
 =?utf-8?B?bmx2T2kwalRoOFVaWU9iZEVsVnFxbkVnUjFiY01KS0xQWlFMMHpGaWMva2Vm?=
 =?utf-8?B?eEhQVWhidm1kSEtPeHhDZU5rbGdJT0gxV3Z4Ly9zWENmdktLU1lLUjU2TWlu?=
 =?utf-8?B?UG5EUjdPMXF1UUE5eFhPUkVSOEhOelN6dlBGRjRRRzhreFdqUE5FVnh4em16?=
 =?utf-8?B?UXV3WnArSDJ6ZXRsdHRvTWNJWWoyZGlZWWhoMEZUVjNTM01LSWV4Z1lsVkFi?=
 =?utf-8?B?dkZHbEwweUx1VU1pRHhHT3ZraGl0ak4wWi83N2VRTDlGdlFsRGVqZExXWXlY?=
 =?utf-8?B?OXFZekRvMTBFSVBRSmUwU0srK1dDWVp6RWQwekZBVnU5b1I1Mno1aUFLMXc5?=
 =?utf-8?B?S1RkU3dZUWtoeFBsSThlNTBzT2NFbXFmcnZ2cjlnWWR5K09Wc2M2VWZpRFNj?=
 =?utf-8?B?Q0dJREZuWnVJWTdMRDN1REFqVVV2WDdMTm45YU5GSUV4ZlRNVFovSTNRdFFi?=
 =?utf-8?B?Rk5OeXRMbXJyaXBqUXl0bEcrZEZkeW5XWWE3VHVOUDEyMDQybU1ZK0dFVzFN?=
 =?utf-8?B?dW1ra0lxa2NGelRQdkh4Z3dtVytscThHcy84QWZIdng5bzZrek9vR0tza29I?=
 =?utf-8?B?SnpBeTJ6ZG10Rk1XWWhrRDM0YWNEZGRjWGkzZ3pLUDUxOGh2SEtKY00xWXdR?=
 =?utf-8?B?Tms4NS9Md1F3RXBveXpUQUlPZnp1SThrVkJlMHdNTFRpTzJCdjdhc1hVaTZK?=
 =?utf-8?B?ZDhYdm5SODdGZUJDOU9DaGtNZGNHMHI3YlQzYSsrYk1HVzU3Zk1wZmc0VEFa?=
 =?utf-8?B?c2tyQ0xxd1gzUXlxRmpLbGFtMkdkazZ0ak9rdWNXckNWc3RscTJnL3gvTHZ1?=
 =?utf-8?B?MnFyRC9CNnY3Zmp6NzAwZ2cyV0YvOUFlUnQ0WVVZRmJJUXQ1bjdPTko1WG51?=
 =?utf-8?B?TFdYOFJvTU9NRjVPUER3KzRob0c4cWJQaTZmdC9YdHgxRklPWDVOT1R2cVhq?=
 =?utf-8?B?UzVkc2Mva2NEeFl6SHQyemdrUEZnTnFNVXQvL3NUUXZLdzRIemFEYUFwZVpD?=
 =?utf-8?B?N3dMbnpGSjV6YU92WjVFR3FsYmZST2Z6VndTazMydGJ1ODladGtpS0pNR3ZS?=
 =?utf-8?B?NWdqMkl6dDk3aTBZU3R5QnpKQW04Y2FOQzVKRFUxVS8wZjU5clNaaGJOL3Y4?=
 =?utf-8?B?NmtHclZBL1gwdFFGYTFrWWU3di9EVFY0UnEreklZcmNLOUh2NUtrRXRuSzRR?=
 =?utf-8?B?NEcwaVFLZG5RS3ZlSWJ3d053TzY5UnIveS9LNmpPWE5qMWxGd2hrZEhCbTdx?=
 =?utf-8?B?cThTM0dRRXEveCtZZXVURktkSDZRL21JSlF1UkdEM1RieWdOcFl0MVJZK1do?=
 =?utf-8?B?aHZFSE1LUVJnU0tYOVU1ZytlQVpkVWY0UHVkYnA2QVlwblE4TnVRWnFSNlBq?=
 =?utf-8?B?eTJ1WmhLemVHK2dJbFJwODdIRlNabXFIa21yU3VKQjZiRkFTWlpSTUFLcG5q?=
 =?utf-8?B?K0hnU3VQeHY3d25XQWQyYi9GUTlxeXN1VG5DUmpFRHJJVTMyTTNNMjQ5Qm9u?=
 =?utf-8?B?NVZYYklydlZGUWhIMUYvTFpibWt3a2hxMXBGcXJVNnpDeHV1Q3VNSjV5OTFL?=
 =?utf-8?B?TzZNUGZmTythQ1dTblF4QWo4SVhYV3JtMWFTSnNucFI5ZGtYanBYa1ExV2hT?=
 =?utf-8?B?Z2xYRUxqc0NpR2psTHZzZEJBYXZtMzNWYlRMQmdLMkZqeUlHSXZDOEJ4d2Zs?=
 =?utf-8?B?NUR6MWpPVW50ZFFLRU1NYlZDTzJrRzB1NFErK203VXVYTVdrc2FmVHRHRlRn?=
 =?utf-8?B?L0dUZWFMemhVN3YzU3dpTHRPc29PN2RmcThxWG9oZTd2NkhxWGdtRysvMGRZ?=
 =?utf-8?Q?gZaMo74asnIGh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkxHYU9XWWtQVU0zTUl4WGhYQ25sVzZSMzNxa0pqdXZKOWUyY3pJRjlNRFNa?=
 =?utf-8?B?dTdYT0g5MGF1RHFLeURHd01tcDk5a284Z21yT0VpcSt3dU1TNUlJbXMrWVdX?=
 =?utf-8?B?cjRTd2xGd1luRkV4MnY1NnBiaVM2Z2k1c1dxTEtpTDUvZXkyNmJWL243Nld4?=
 =?utf-8?B?RE1tZTh6S0NteTN5WFFYVnlsNnl2SjhBWVhneTdlQmtxUFJHeENmY083bzJN?=
 =?utf-8?B?WlZSclZIeWxzb3JRV2xLVXVLQnJuY0oreHJkRHluYlpiT1VHTXg5SzJUZkRj?=
 =?utf-8?B?bGxuTVZqVzNNVC9wTS9NSkJ4dmVObkZTc1hJVzZjQjFZOEtZR2V3UCtCUSsz?=
 =?utf-8?B?a2pySzkyL2FTY0hrRFBxZXlheVhZVDQ0YnJ5b2lEMGRORGQ5MzcvcVlEVWpG?=
 =?utf-8?B?YnROWEwvVlYwN2tTRGVaTVJQWmtkVmVkWXdFTWhWZ21RMExUM1lmOHdnUHVF?=
 =?utf-8?B?NWdWWmd1WThudDhaVFl6NU10aHptbVFBQ0o2Vnc4YlZEZzBjUTZaL1ZPbVMz?=
 =?utf-8?B?V0xodGZVcSt3WlBVV3pZL1piZ0V6ZjhvbmFPQnBHVDRPQno3TnhrMzMzeHhD?=
 =?utf-8?B?OXRsL3VXazIxZ1BJbmw0UDdRMmZXbjBzbDBYdnhuVUlTM0RmZWtoVW9ZVnVn?=
 =?utf-8?B?c1lncmJ2L2hkeTREZ0Npc2VHQitQQTUyeUdvYS90NC9pM21vdGE5ZHBXdytq?=
 =?utf-8?B?YmljbUFybnJ2d3VwZC8wSjc5V1hhSkdFWTh2L2VQSHZpNnhkSVdBZlppZ1kv?=
 =?utf-8?B?TU0vTUlIRXU3RndEMmZQcWJJeE1FTUhwckE0T042ZEFtVk1KRzU5NzBkbkRI?=
 =?utf-8?B?UEE1Tlg5MktQNU1VU1hCMHpRaFpDTG82MFRwUXEvVHdKWXR1c0crT1drWmlC?=
 =?utf-8?B?ZEQ3cmlWdFlBL0lYeGdISGJ6Ui9DdXc0NkJoR1kwOEVhV3R6ME9HMjI4dXZB?=
 =?utf-8?B?R2NvNWE3Y0ZpZDJNaUh1VlFBckNKbXU0WVV1ZnBIcHRFcmRsVEc2VjNlelp5?=
 =?utf-8?B?ZnJQcHBtdmlqS01lNkZLSFpHVUxPWXBuRVZFdFcxODZVMUJSTWpkTGYvZkhE?=
 =?utf-8?B?OXpWdnNlbk44WjlpVE9qa3ZiT2NsZndPWHVTLzdnWkhQWWN0RjRmVThTM2xw?=
 =?utf-8?B?cTNMSGFJTS82N09LZTZaZldtcU1QaHVUL09tSWlhRnVOazdFYW5ETVVSeUxK?=
 =?utf-8?B?MllHM1U4Tk1WK0VubXNQZW9TN0ZoRUwzSXpxWjRnQXdWa05DSjloTXRTb0Rk?=
 =?utf-8?B?ZUZNVFk3K1JBL3pGUExxbGc3N2dwWGVwWUJCaU8rWmY3d00wN1haQ09tTW5v?=
 =?utf-8?B?dVVsc1IwUnhVaWowNDVKaDBJK1JKdVhoL2picHA4OEhiKzh1SldnbEt5V2Zp?=
 =?utf-8?B?d0NKYnpHRW1HY054MzVxNGljb040alcyMGVIOUdCTlRta2lwT1I4YnFSNjFi?=
 =?utf-8?B?OTgzNjJnSGpMdFREU2JmZmJTUC9KUmptVGZQcEN2dk5PdE8yWEpWcFJJcDBm?=
 =?utf-8?B?RmtHSG54bElEOVVVL3hEZnJFekx4UjlmNjUyRWRDUTcxSjhISk1jRzI5Nkdh?=
 =?utf-8?B?WG1sa2dxZkxOQ2E3KzE5UllkRnNjS0w4eG5mU2p2WjkydUhweVh6WDNSVThr?=
 =?utf-8?B?aUhkMDhhYmVycU5jV2xTQWFnRVpTc1krcmVRcHhXdXpLRmwyOGF0anZqT21m?=
 =?utf-8?B?NEdoVjNyTyt1bE43ODBLM2F2NFVVcTlVWFVGSE12dnAwZDV4a2lxRTdmUVhm?=
 =?utf-8?B?a21JM1drYVpZMjB3d3pVS3pxek40TWRoTEE4K2dnQ0ZrM0FnTnlJcUFBYW9k?=
 =?utf-8?B?aTdITlRhdVlVaGNORTczQSs4RzFqK29TcE40aHRJM0FCWm5zTDd5eVpqSFpJ?=
 =?utf-8?B?Z0xCNVZrd2t5MXQrZ3l1WWQ1TTZaWkJSTGxaUWpkS3JtQmxKd2doY1VsUjRw?=
 =?utf-8?B?ZU5rRW5IbFRNZUhQY1kzeFdDTU1TZE90L2xXVWRVckZucFIwdkM2QnFaNm03?=
 =?utf-8?B?VlVOWGVyMWlYZjZJbTJjZkxINnJSSm9ITndqVTBRalgwcXNWaEphd0x1RHRk?=
 =?utf-8?B?cWFhdUVwSHF5c2Z4Q0FjcHNqaEJ0S01HSUJNeE1ONTA2cUg4MDJFUEpYcUF4?=
 =?utf-8?B?dDRoQ0xZYmFpNmZyb1preDB5ajVUdnVGRmlzcmhDYURuUU9NbUhwSVBLUG0x?=
 =?utf-8?Q?5g6igGNUlWgbP9QEhUJETF0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f71de0-9c8f-46f7-7dc0-08dd76885db7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:30:21.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu09azycdNr6jXHBGc+yOhQqyGrUI5WsJyrrVlzR1lrMjZEkpLMdLNF+mgS/z+D091ltGEKao6HTZhyNKxADd4May0TVL2+vqq/FtbEPFvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

On 4/8/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 08/04/2025 11:03, Daniel Lezcano wrote:
>> On 08/04/2025 10:21, Krzysztof Kozlowski wrote:
>>> On 07/04/2025 18:03, Daniel Lezcano wrote:
>>>> +
>>>> +allOf:
>>>> +  - $ref: watchdog.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: nxp,s32g2-swt
>>>> +      - items:
>>>> +          - const: nxp,s32g3-swt
>>>> +          - const: nxp,s32g2-swt
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Counter clock
>>>> +      - description: Module clock
>>>> +      - description: Register clock
>>>> +    minItems: 1
>>>
>>> Why clocks are flexible? The SoC does not change between boards. It
>>> should be a fixed list - block receives that number of clocks or does
>>> not... unless you meant that different instances of the block have
>>> different clocks?
>>
>> The documentation describe the watchdog module with a clock for the 
>> counter, a clock for the register and the last one for the module.
>>
>> IIUC, these clocks are enabled when the system is powered-on or exits 
>> suspend.
>>
>> The driver does not have a control on them.
>>
>> The only usage of the clock is to retrieve the rate of the counter in 
>> order to compute the maximum timeout. So only one is needed.
>>
>> However Ghennadi would like to describe the register and the module 
>> clocks in case there is SoC variant where it is possible to have control 
>> on them [1]
> 
> Different SoC means different compatible, so I don't get why this is
> relevant here. Either these clocks inputs are there in the hardware or not.
> 
>>
>> The goal is to give the description the flexibility to describe just one 
>> because the other ones are not needed for this s32g2/3 platform.
> 
> But bindings are not meant to be flexible but accurately describe the
> hardware. If hardware always has these clock inputs, then they are
> supposed to be always provided.
> 

Indeed, as mentioned in my previous replies, the SWT hardware module has
three clocks as inputs: counter, module, and register.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Ghennadi


