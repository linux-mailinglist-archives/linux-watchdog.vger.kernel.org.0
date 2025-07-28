Return-Path: <linux-watchdog+bounces-3910-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A1CB13A18
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 13:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5ED1738A5
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FF225F781;
	Mon, 28 Jul 2025 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="hhRe0LhZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023073.outbound.protection.outlook.com [52.101.127.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201C251793;
	Mon, 28 Jul 2025 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753703781; cv=fail; b=KwXE7r0wix0kjaCgx5qmTNJjoEO622I4oiHvGGSTOWQ4Txe3Bji0Fx+zf9Dx0ozmGg0yozo2zsMTa5tIEz6MqpWMzJBRc7aWNPjnA4PTuYPlDAUOYxqxriA8tyvSUzw3/cgh2AGE7Nsq97Dzx0asaP+2OeLG6aNW6xo/hjRpF5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753703781; c=relaxed/simple;
	bh=XxurQ8w52FKxtBlXddSlqmwzArLjH8cJMj5YTXzmHVc=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=OKNEyf0YFXyfQyl0KS3soBYajKpkca1kGcgYZd8tAkSPLBtSx37aBl21sIdBVZlgUr5pcLE/OXnJNI5uKGMPIOUrQgyPfDcHEkIjcRD6vGAr5lnGBSDN0bhq9HzpGnXKM1dlXkuXA6ZxUKGWX9yZYGkuTIYkf39UuBW/DU1ydsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=hhRe0LhZ; arc=fail smtp.client-ip=52.101.127.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc91cuOiC3GeHc1gBqqTm6DwKeGr9UDXOajkLLrRcJPBjW492jINSEjOCEAYf8WczOLvJyq/dFcWY/K3jaa64GeUAhn45zWkRj/c7lGtoLDn+lN1SBs+IZw5fg7S9zoQDkia68h4orOPr7BYgO3lHLGv1GF3BvnVEGOzYFoAGIPEdpPRxab7J0lrtMTU88ZIRhQIn8T2vuDIMxmdS1lvRDLeT6qqIHMGsgatBJfb4PtwbDuXUnrhsFqWob4bY2vL4QmFd3VVWFUWRTYzCAsE3qc8AXzSUN8n3lE5HzXRDAoxjA+j/cVVX+K7QEeoZqkAcIRQxFOqKcIzcjUfncLG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bkc+8+WAU835TK3i8Vv0Zta1MV7eTBhijK6h/IRJJck=;
 b=kczuwHkGd1cVWciji0hKPRGeZlKm4Rnn2STX/b5WgcDWpIPCCFGFBZYu/uLN9Y0oBuDO3OPlfc8Okj2kgzT62zGsbXovrcnDwwrsOH0BNhvMKOqYhiiKuUyDXdzC8xB9C94RkP8DAhnTdYh42zkW8QN5tdf5USC1ZCUMy3epW4hrH9+VdvlbWVanrLHIWxRSQv5YBJu/kfXTEiD6hVWpg4cVq0915LMQpB5xN2yVeyBXKYARWJvqIjsF7gXgbI5hWHhSztdU3m4tvV5fV2b5fIojSKvxEKzL5nfjRCDUugp6RqMrCOrBcz74y7k0jUhYSaMfmg7oI43SA5rRCHTE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bkc+8+WAU835TK3i8Vv0Zta1MV7eTBhijK6h/IRJJck=;
 b=hhRe0LhZoXwZQkd8ZmChNbmRIOC/dphSvPb3jtWc8xlxG78+nIWOhshb+usgt6MhymsmWBtBfTtagLeCHK/WJipPcCi6pFR+wgvyEsq7obCve0ZZW8ub3Utxz/TGgPvZ/vraxCQ1Q68K8MGURze0lzjZxCRZiUkBgHsn6t5hJbaHPj3gvluxAKND8vuYjkDvdhLuhSx55Kq8CtjeRr6VkYhv7DivSGDNMXB97t3vV4CDFsJWNmRP5+yh4ze3j7sMOWmFnDt4liSzlxQm+vfKlf63DBlrgvY/k/FWyn+DswHivkBHrnWbpD3cBPbCZdYxBlpQkH37vKB+NiqCuIgbOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SE3PR06MB8108.apcprd06.prod.outlook.com (2603:1096:101:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 11:56:14 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 11:56:14 +0000
Message-ID: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
Date: Mon, 28 Jul 2025 19:56:09 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v3 0/2] platform/x86: portwell-ec: Add watchdog suspend/resume
 and hwmon
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::16) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SE3PR06MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2f287e-8220-4faf-a14b-08ddcdcdc0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWtXVFd6RFd3b093K2xEQklOZUZKbUpCdmdNRU5zQnRKZitrNW5JdEN3V042?=
 =?utf-8?B?SXJiTndPd1R1T21EMFZ6Q2VBL3lNQWIrdG1yTWZkRjFVdk1oZXNVNEtmVHYx?=
 =?utf-8?B?UXNBVlJxeWc5QXRGMk5tSk50cmtodXh5MWxGakRKM01PKzJNb1pGZDVUMGtn?=
 =?utf-8?B?b291NHlkMW5BbHBVUnowQnErTWpacXNVTjF3cTdYZVdwSWppNzdxVXRzV1RK?=
 =?utf-8?B?U2M5UW1NbVFZUTBsRlluWXNCSWhHNG04QXZJWkhZbEYxUFlPS3FpbmVvbjU1?=
 =?utf-8?B?S2Y2dWdxTXhLVlpNUU1ZbXFGL3JlV1VRdWJqTjVMMVBNcC9pS3FmakR6M2pJ?=
 =?utf-8?B?aFNqRVdOQkx2cVl2UHFwTGlZeENuWWlSaFQweUpnM1RjNG5oTEdFNnJPQTBa?=
 =?utf-8?B?eVVNZ1ZXSm9zNW50Nkk0S0NqMEpvcGxXY0FGVjJOSEtwUHFaNnk3aWhHUWpv?=
 =?utf-8?B?a3I3UDRlV3lOcGVBWTlWUy9RNmhycTNMMU5mMTgzTDV3cVFaenFFYUdzMSth?=
 =?utf-8?B?ZnpmNSttTFh6QXhnTE9Ybmo2eXFRVEZsOExQM1BxcVdzdi9CamVmbmE2MCtS?=
 =?utf-8?B?RTFYTS9kRnEyL3hVS0lra1QvaE5VY2NPa1FBa0tUNjhHRDVLRFVrVnVIYTQ1?=
 =?utf-8?B?OUNZMGJudjRpcjNyMDl6b2grdjNZNGZleUhjTXEwZlZLbnhKekh1VTJTdkhO?=
 =?utf-8?B?bjdKaXl6WWNscmlQTklLZTQybkFOcWhBRGpQY01uUHNHb3VPYm1LL0hkc0hV?=
 =?utf-8?B?TDZ1RXpuUHJBS1pIUk9Fa1VEV3BnUmRQZC9FbVFFcFFLVEtnbVFBc2lsWFRF?=
 =?utf-8?B?OVgva1h0MUQ1S1lhYnA0K3U4emZyMjVNSFRDWWtvZm9hUkt0UTNJN2plMW1Y?=
 =?utf-8?B?WHIzNlF6UWs5V1J6aG5BWnczUlJYTkZ1Q0hway9DWFFpQVNoZUYzQ2pSc3p3?=
 =?utf-8?B?a2tJaDNqVkZ2MUxETmNvU2cyQy9uaWlsWFFYWmdndGh4N1F0Yy90QlpJcmhQ?=
 =?utf-8?B?OUJtWGdDTllmWEV3elRvWE5YS2VxQnVLc2VqcTZNaGtoOUhEMWhlL21kemtZ?=
 =?utf-8?B?eDFsdFVrbWU0dElxbnFZeCt6RXdNc0JieVhTQjB2RU9PQ0ZVQldFTFpaV0dE?=
 =?utf-8?B?ZnZEbDNpbmZjenVWdnhPdko3d0NobXBWaG5lblRHb3FMekVPR25EZWQyZ0VD?=
 =?utf-8?B?cDhvalNqb2ZzQk9venQyNzJ6bHZ4a29xbWFzWFliNjY5NTV4OW00RkFPSUIz?=
 =?utf-8?B?bGNaWmlYTDd6UUErRFZWbU9oLzg1dHlNWVl4RFVGRm5KYUM0RXN0TWgzTExO?=
 =?utf-8?B?Z2Y0QVR6MUJXcmRyckNSTFBoM2FGQ3RzL2NHRTl0VUVpTTRqS3ZxZElrNHk2?=
 =?utf-8?B?ZEcxdnRES29HUC93dWVHSllBQVpBTzZVejQ4SERtSG5PaDNqSElqSjdXTC9B?=
 =?utf-8?B?N0NqMk1rRkFuc3VBallJUjBnN2MwMXUxOFYyZ1k4UGdWS3BQcFVmWDZEci9G?=
 =?utf-8?B?aUowWWRDc1AvSlNoeWhXYmVBYUg4ZXJWeFZlMVRCOHdJOGx0L09lL3lYd0Ir?=
 =?utf-8?B?YjlEV1Uva0FvYmxVd2dJRTZCNHFyMUgwejdBWTNPSXVaaHcyeS9Za05DRlNM?=
 =?utf-8?B?YnlQMnVQcXlCVHVLc1NBZlJwc0s3cG84VjgwY1phVHgrdGZFQ25YeCt4MERL?=
 =?utf-8?B?aU5GdC92YTd3dTN4VVdTSGNDakdRdXRweU9ac1EwWWhSL3FuSFRoZW1XOElX?=
 =?utf-8?B?eHBBSW9QRE5jc2c4N2hmOU1HVGJrUXdjNU1kYVVmdkpvZ3lBSkZ3ajZWamli?=
 =?utf-8?B?NVRiRjJuNlBxMXp1OUEweWk1RkhPRHMzVlBDelBpaHJZc3Frd3N5VE1yMmtN?=
 =?utf-8?B?RTdKbHNNRllGc1pmemFpRWp0WUtjOE5nUFBmU2VrbG1wZ0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmtUNmtkR1FhdWNIZHF6cEhBRElDbFRQQlprT0k0RU5ZNkF4ajFySDV1WXJ6?=
 =?utf-8?B?VDdMQi95aE5yaitDckNBQVZlbW1yNldIR1hjWjcrTy9sazJrTVN4R2sxYk4w?=
 =?utf-8?B?SUd2QnZ6NXp3L1dLTThtTnJWRnVnbk5jK1dBYzJkMFgyZjJrWFFiNWplTHNR?=
 =?utf-8?B?aUw4WDN5ZkFpWCtYV0VzQ25hSDRJZWJCQXhheVJqb0xGTzVpWGNOS21CUW9Q?=
 =?utf-8?B?c0dwcTl5M0lLVXJXbFByRXhRdjBLVEt3T1lDWERrZC9nTnM5dzR1ZDBLQU14?=
 =?utf-8?B?RVd4K1F2MTdnbmFreUwySGZsZGZnUVRoYmVQaFlSOFRGZHJnVTF2dzlCYjZS?=
 =?utf-8?B?enFGUUZPeTJBOGZsNkI4VklOL0Y2UmoyQlRKTWtrY0xjSkRCMUkyMU5JckFo?=
 =?utf-8?B?Y0ZDTUNFVlU1N2VkQW9tZVJ2VlBxWFRnWmhYTXE5b2VVRkNyTFQyR05SdDVO?=
 =?utf-8?B?L1VHdFVhMmNlaHhhM1pEbFZZalA4dmRpNDFlZzlLYnhzUnFTYTZOM3dSRW52?=
 =?utf-8?B?UEZoM0NFbWJobkowWlZVUVY1NWNZVzkrQmtxWjFSVjNKVnk5TGlaWEtqZTNH?=
 =?utf-8?B?bXQ5K3dsbkExR2t5STZpalhqTjJWdGNhK09vYVQ1K0pGamV0U1JGak4weGg1?=
 =?utf-8?B?SEd4S0haOUxZNHplZjU4c1dSMzd5Q1ZCeXUrMDJoVXhWUmlYamhrYkt3Wndm?=
 =?utf-8?B?SStOWVNlTlBibGd5dnhONi9DcW9lcGRrdTBPc1hqb05yUzQyZHpUTXRCYzNY?=
 =?utf-8?B?dzRkOWRjQUdwM3hJWFozbGcvVEE3VEczaUw0bkZwcGs1MnoxWjVmR3lCemVl?=
 =?utf-8?B?eWovKzBhS085a1hVcWZlYmkvNGYremllNFJjVWdNVnR2S1hER29HY1lwcWtt?=
 =?utf-8?B?bERUZVpRb1ROdG1HbzYzRFhWVXllYXRMQ21mU1dZdm9BL3JaQkhrblphOEJh?=
 =?utf-8?B?andwZHhwWnpUNGkyRWUzRlBwZ1JXaGpFcDNsT2VpN3EvK3ZFRU93dURoWkhq?=
 =?utf-8?B?ZStQT2lLTks5dUVaS1NBYm1qZDdwQk4vRURaY1dWWU1MUEk4TWpqaVNwUWl3?=
 =?utf-8?B?UVFqOXAyUzNPVGdaT0xkR0ViWll2T29nTm1vMFRYSTBzNGY5WnpMSjkwc0Nr?=
 =?utf-8?B?T1I1YlUwUHZwQUM1UklKSVZMTFY5ZlY5NWhla2dHYUtycEVZN20xK1ZiaE1M?=
 =?utf-8?B?T2NNNlZXaW4yTk9kWmlFUVVxdjBIWG4rWllRQjNsbFJKRVMva2NlYTdPWVpL?=
 =?utf-8?B?RmlWL0c1UzU5VjRmMjVXT2NNVW9EdXJGY1JxVE9yZUlweHZtR3BFYndka1Nu?=
 =?utf-8?B?QU1UczIrZzN2c3MzQ3Q5VWRDODVnUEVWN2hHYkNwVXZZdmpjTGh4TjQrcGsr?=
 =?utf-8?B?ek56QzhZNmFiWXhnWHdYQ2xBaGd5VzVKRmc3SzkvWjNOZWZsK0VoWkpiVXNw?=
 =?utf-8?B?ZW4rNE0zZGRmS2p0SE9oQXA5THFNRWNKd0EybDhyTzd4M1BIUEZzSjk2bDUv?=
 =?utf-8?B?MEZvK0tPZ0RqdjMxa2VVRkZ4Q0FibkdZS1c1OTdzaHNYbnVoQzh5RXNnNnhh?=
 =?utf-8?B?WUtXY0lPSVFkR2pTQW5FYjBQS0RrTnNnSS9hbzQrN3gxcENxZXp1dFFtN1dN?=
 =?utf-8?B?bVZaTHNreG1ZQVhkUGJXVlVEMkUwZGRZVllTZjk1c0JNMnJON3diWFMzNXlV?=
 =?utf-8?B?eThPeGxFU2JhVWdmTUpJK1I3VDFHN01iYzQ0c3pyTEgrZG9LUHhmVjVCaFYz?=
 =?utf-8?B?M0pOZFM1dTNYTnFaVkJWUjZzZ2tnNGZFTEkxQUlxZkh3VlYvMDd5QWowMlZK?=
 =?utf-8?B?TGtBYWVCT2hVM3BlMWQ5bm9IZTlkbnl6MTFmTmlSOURzN3NlamxWM1ljdGov?=
 =?utf-8?B?SHJ1YXVEaGV5Wk11ZU0xMEM0NDhXR1hvUXNXMUFxeEl2SDgra2lXdmhhaHJD?=
 =?utf-8?B?aWdGL2dleStqa2tMOGJKSjBPQnQ3SjZaeTJqWG94YjJDK3ZpS2tlaWFpVVdQ?=
 =?utf-8?B?elQ4czZYS2lmWlU3aUNVbXVWN3l2bEVTRzIwWmFSa2FCLzJkd05iL3phMzNa?=
 =?utf-8?B?QmVicUV2ZjlMZjZ3eDBwdml1ZGJiVCs5MXhvQUVCcURKaVNSWDJhVGxhUFJH?=
 =?utf-8?B?V3pkOGhhVTFWVjY3YnJLYkxMTUMrUXN0aXo4QlZSdzRXRmtKRHFXejQ0cXRR?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2f287e-8220-4faf-a14b-08ddcdcdc0a8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 11:56:14.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39sD/nAxnskqxyuMoxAI6tFFuYl0S1Wi5/TXCF7KZJcHZh6pLZj3wX6WPYUJQlCwhe5Knpgs+Z1/aSfhuGk9yVCNTpS4r6xlEmBwCNHhVBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8108

This patch series adds suspend/resume support for the watchdog (patch 1/2)
and hwmon monitoring functionality (patch 2/2) to the Portwell EC driver.
These changes enable better power management and sensor reporting.

Tested on Portwell NANO-6064.
---
V2->V3:

Patch 1/2:
  - Unchanged

Patch 2/2:
  - Replace hardcoded `1000` with `MILLIDEGREE_PER_DEGREE` and double check
  - Fix comma placement and spacing coding style issues
  - Simplify pwec_hwmon_is_visible() with ternary operator

V1->V2:

- Added watchdog mailing list to Cc.

Patch 1/2:
  - unchanged

Patch 2/2:
  - Removed `msb_reg` from `strucit pwec_hwmon_data`
  - Updated `pwec_read16_stable()` to assume MSB follows LSB
  - Moved `hwmon_channel_info` to per-board data and assigned it to `.info` at runtime
  - Replaced the `pwec_board_data[]` array with a standalone struct
  - Replaced literal `1000` with `MILLIDEGREE_PER_DEGREE`
  - Removed unused include and sorted header includes

---
Yen-Chi Huang (2):
  platform/x86: portwell-ec: Add suspend/resume support for watchdog
  platform/x86: portwell-ec: Add hwmon support for voltage and temperature

 drivers/platform/x86/portwell-ec.c | 193 ++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 2 deletions(-)

-- 
2.34.1


