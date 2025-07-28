Return-Path: <linux-watchdog+bounces-3912-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B1B13A2D
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 14:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B8A1785DD
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jul 2025 12:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF751B412A;
	Mon, 28 Jul 2025 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="KSFgsjao"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022129.outbound.protection.outlook.com [40.107.75.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7D262FF0;
	Mon, 28 Jul 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753704126; cv=fail; b=vEQOsBgZHDHxH8oKq0gnPYkjCOHVqpQw0ciH7l4y8aMSSqcn+0c6pEO4O0c5WTnHRwjNI3Yu/SNGmrQhq7oz4+mUF+EFkZxzgfH77x0u5RMQpqOr1ELigxfDocR9LhOvkqLIPVDvQcRBXjr4nOwx0Y8fsBNJHMcQy/g8AU64+eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753704126; c=relaxed/simple;
	bh=EGzI8zIkBWXtH+fwM6yVbi/16QIdOrDmyLOQv0tJLzo=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UNxmUijXQC1w7tfAvBLJX/sIEfsL+KVCctTPmF9po3REM98VH4BAi2fJoqV0YCT8FTsZyyDytu5PFrcJaiV6V2j0Wty+11SYr98QEKOk3hPAm6st38Y21b60DakF/MD2607BHkzauAM1ZPrfkJrx5DedEuq6lKqa18aBBqeTwiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=KSFgsjao; arc=fail smtp.client-ip=40.107.75.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqVTTOWUKG56bjwKTimXpIlKFUEvkn06kAH65ksMFlxB8VA8GnhJEN3b0VC24v6dTXDeyXQnayiFXahjMT7Z78k9a5nT4Xos9poOeqSGkjo5RDaep1A+z6LcDr5URjIfWlbcmCBY5F4rDq+/DDZdBIreR1QtyZrN/+Zos3KpWCLXdfhfddQR1SmVpepVhFPyr+ngNO+F0ctlDAPZa2KV0ihWeMpeVjCtcYiw44tW5WYl89CnXb+gcUO7u4Z5wzYBSykccbKATuguSoW/7SbqTCxMUDZRpEuUXMjT6LEy37MQtRilNT5lRFaMI5F+H8cIucm1kpXov43f9M1eveC2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4A+uTT2oUwnTAbge7m5dVB3DnzZEede42lTTiSUoVY=;
 b=QXaimXABMu4mvBeiXCWYBdDSwJq3+El2mDko6ydDod0uisfaaPJfl8kva2Rcl/5P2RJrfHn9W2xSqzVj4k0AyT3KyKpVRCdvxb8cK8LwGdqWlKT2LMeZDOTlukRwBW58F1qWWPt3Aw9Ia+dO7On6B+Ub+e6nWURjSW0GZY7cvmJsc1/Ostac7UHQWK420KkoECZpXt+mEHzO3XgEPGdkRCRPg+vmrFJsnqjU0uU9Pw2evxGWlgWrrPoucQ4lv8z4iQe/RBERUOXOiZqlbxz6+vcMW9kkx5B6lH9OzvD7utwwHQOoa1Kda8IKPnH1A5Th70iVZh2PI8xvnAcYjPpK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4A+uTT2oUwnTAbge7m5dVB3DnzZEede42lTTiSUoVY=;
 b=KSFgsjao98JrnRNL1/R9bT4gG0u3kokbyLEdS0hyA8IVJil5eTEf9lFo0B93/eEhLCUuGojjwj+ONS8WJUuIqKMdIv2fMSeoYFRnBJaD9LLfqipiYjBEKvEIfZAwLAlBsZ3robM4zcWveVGj5of1V6n2AGxENxf93qcAcfButzefBop0H7BfXDtVP5rBJBeaCKKA2UoTJPQPJuKYtpQKhD3pJz1zD9IFXReXupgf2pfyxgJmzv/xJ7aFsSQSBNg/WWJurYUvcFdgL7wt1vlQLyVWgF7Y8NWva61ag5ggG6Xogg1bnW4ba6APcVlk3TVyQzmkP0FHldPXxIsqadhj6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SE3PR06MB8108.apcprd06.prod.outlook.com (2603:1096:101:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 12:02:01 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 12:02:01 +0000
Message-ID: <d6429164-46dc-4c0d-8d6f-4650e0b92f22@portwell.com.tw>
Date: Mon, 28 Jul 2025 20:01:57 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v3 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
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
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SE3PR06MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd38ebc-f660-458d-27a3-08ddcdce8f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmNXNnJyOERPa1NSeFIrSzJmQVFUN01VdTdOdzhVdEtFcjdZdnVCYUp5WkJy?=
 =?utf-8?B?a0RWemd1ZlV3OEhNU05MSjROOUlZNTdBdXVvbFZFVkVoaUNra1hkQ3I5ZG14?=
 =?utf-8?B?QklrUDBhbXMxL29JR21veUpCVGplMC83dFlObHRMVzJOT0hlTXNFZVphaGVj?=
 =?utf-8?B?NmpxRFVqUDZseFpaTnpuZzA0aE1UNzgrczlxZldVYzhkSXBIM0MycmtJNzVu?=
 =?utf-8?B?UVFRSHdHVWpPcGFMSjlkcDRrMkhjUEt5K3R0cVgrMjRicEpIbkQvanFnNnBa?=
 =?utf-8?B?b2JsSDdhWHBIV21ITy9qMnVaTmE0a2JMNDh1by8xL1I4Y1VIUEVMakY0c3ZS?=
 =?utf-8?B?aGlHdFErcWVoQ0hET3Q0RnkyRzlTTDY1cjRLaytyTXNUYU1RdUdxWUlyMnIw?=
 =?utf-8?B?M0dZMDJaMHNRTWtmSktUZUlyVlhyM1NCVVZESW1uRzdqUkMyd0tZVE90aFpD?=
 =?utf-8?B?U1JZcUVVZTBaZFhzejArVEJLb2d5c24xY1QrVXFOZnExRFdSYnBDanp2VWxh?=
 =?utf-8?B?clcvekZCYmRHUGgxb1VHNWNDcHA5ZWhDWGJ0YjZCQkdBMm51RGU5UUExZCtp?=
 =?utf-8?B?NjM4LzNjRjVmTVlNSmVhQ3ZsVUV2cFg2RU9sTnFNbjNKTWw5VG1saWd3L3hx?=
 =?utf-8?B?dWpXdG85NEJLT21RRldDMHgzanRaR1lheHhyYk9neDhmeTI2VktGSEJYQk9Y?=
 =?utf-8?B?ZUpxSEx4d2s3QllGajE2QW8zZDVKZ1EwRUwvTDhuc01kc01nZ21oVkFBODho?=
 =?utf-8?B?UUw5TjlXdDRsd2gxVUVLUVZOZVpkZDg5UVJYbVV4Ky9ZQUVWVnJDQSt3d0pN?=
 =?utf-8?B?OHF0Y0loUm5vMHBkN3BJTWZhNzI2bEZXVG8yK3NnZGpDNmliTm1vQitOVlBj?=
 =?utf-8?B?djVwSDg2MDQzVDNTaE9KbjgxeVJiTVZqZzJrY2syMnZKVS9FOUFCdXhkN29p?=
 =?utf-8?B?UWxaWnNnQmpsVjJ2TEJqUlhDQ1huME5QWEo3cEFpOHVJK3cxZktjQkRmQ3hW?=
 =?utf-8?B?U3UrVXJXM0NuY3lqOUs0OC82d0ljZ3h6YWFaUW1ZbjYyRWtmQmkrZS9UYU5q?=
 =?utf-8?B?bVFvTFlLRy9KRnZhUmt1cmk3eHdBUzhLcEdjdzd6bXRZT2VtWi9YVHpOMVBF?=
 =?utf-8?B?bmx6V2pCTSs5TjFGY3hIU05PUUZjeUkvQnhmQW1TeGg5bUtKMHhFbGxiZmlC?=
 =?utf-8?B?aThVZitUOUpwYXdtUXNWWk5OZlZ6VlFMMnl3L2xBa0gweFdYL1dvdktkays1?=
 =?utf-8?B?Y0NnQ1RtbGE5MlBtaFF1NlMyZXA0RTc2YnJ2aFU0NDIwL2liVk1YdVUxUGVa?=
 =?utf-8?B?cldLK3o5SkVEbHgrclY3c1VUdWl1bjA1SGpva0hrajZBNmMvTFEyUXRQQlg0?=
 =?utf-8?B?Tk9sRWlyUFN6VUhsZkVEUlViQmFXNlVkVUZRbUNrdmVxWnBEdFBkUnZ1MHdY?=
 =?utf-8?B?T3l0RktXVGUrd05CcnE4TjdNMWY2YWpPTFhOS0wvdGtUaEREeGhPOERJeXVR?=
 =?utf-8?B?aHVBbXp4bXVRNmV0RVl3bFJWWmVyc3NiNldmRkpVSE1GK0JpbE9KaitlRDhv?=
 =?utf-8?B?b0h3UldzWWE5S2RWWkRKRWhQT3JwRkc3S2dVeVlKUlNzaUNFdG52SFdwYWlR?=
 =?utf-8?B?T0hDOHJSK3N6TytYMDlLWUdQT0x4MWJTdG1iQnBxYUdtWTFVVXp6L280dmRP?=
 =?utf-8?B?TzY5UnFJcXpycFBhTnhDVk1zS2VUNmNPcHVQNXl2Mm9lQ0dCU3ZrYnBGQnQy?=
 =?utf-8?B?eC9pSWF1WGJycmladHMwT0ZJa3IxT0l6Z3VwVFQ4dGlKSHU1enRkTFB0RUp3?=
 =?utf-8?B?bjdCcFJiK3RvTjV0U1RRYjBTL2VndllWWmJ6K0lmY2E0U2ppT0xINUZmdng0?=
 =?utf-8?B?MFR2bHJENXpDTjdBQ2xmR1lNTEdnZEFBT2xKd2U2R0RVRmUxRVo1Q3p6ZHZI?=
 =?utf-8?Q?QVe+t+i4wJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmJCdWdqVmVnQngyZ2x5R1F3TWNJRFQycTNISG9ucnFkOCtpTFQvYTBzREZn?=
 =?utf-8?B?eE0rLzc4ZlVub0RIOVNIeG50aWhpbThheXlhYlFGcUFWeDdnS1ZDMGI4MlBk?=
 =?utf-8?B?SE92ZEhjcEFHam9jTWJRcVNUQ1cyaEZvNkVqMlhsWTE4Zlg4S2hZb1dqSjQv?=
 =?utf-8?B?VEwrVE1iZkxsbk5aRS9uNFZzVjhvTWZ0TW5QZkJWMy9oVU5vK2UvY1Z5aWhv?=
 =?utf-8?B?cTZKdFdUZFBWWFE0cXJXMkthWklkWVovS29mcWpRMG5FRXVkWTJ2L3ZTSWhl?=
 =?utf-8?B?YUlORjBLeHlnU2w4MTF1M0F3RmRGdDV1NlZxVWtPeVh5Mk14N1hoU2ZMeGY2?=
 =?utf-8?B?MmxCYlpIL0pUaldMYjZZSGZuVWEzakNaNWVlZWJvTHVnbXpKdUVad1BNdFhh?=
 =?utf-8?B?UlN6VWRLNFE0dHJtSS9sLzVBT2prd25weEVPY05HUDFrcVk3d3FhcnhaSTlt?=
 =?utf-8?B?NDZpQTVad01Cd1RTSGIxU3M3VWx6eGVBSFYrUDNlYXhKcXZkUVhENzVnZEdl?=
 =?utf-8?B?c0UwYyt2SnI1N3RJazBSd0hwWHhYTnFlcGpjRnMxS3FtcnMvaithVjlzdWdM?=
 =?utf-8?B?blU4VGFRWC9lMU9SSHU3RnFNMGpxUHo3VmZEajZCY0ZwUS83dFl3eUJPbHRq?=
 =?utf-8?B?T0xKZ2tKZ0tGdHV1S3Rhd1BtRjJNWEhhT2UvR1J2alFtaDBMMXFvRnBOSnUz?=
 =?utf-8?B?eUZzOVBuWnIwYVV5bGhPKzBNT2MxUDI1MzZDWlBscTUxZ2M0QytoajZtV2VC?=
 =?utf-8?B?QWlQUDd5TTlnbGdlbW1LY3pBdFB0dmNsazg0S3lYVHVmZFIyc0I0NVl4b1RI?=
 =?utf-8?B?d1YvWFowQkdXN0VsUGxoUmFVQnRCVHVyQ1V4OVdEYjRieWM3dWpINjEvSWEz?=
 =?utf-8?B?UkN0NW9kNEtlTldTYy92Zy9IdFkrc2RDOG1YYk14QlhBWGdEVUlYTm5rQXI4?=
 =?utf-8?B?MG5ndXNnbzAzeFBYNFRSNkI5VHdTeE5RbUE2THl3Z0JpSGhtUkZVQ2RRN0pM?=
 =?utf-8?B?ZW5LNjg3RVI5Z2VtUm9rS0NVYk9McVJKM1RSRnZwY1hta0ZMeHp3WWFFZDNG?=
 =?utf-8?B?M1dFUlF6enV3clIrMzZUa1BSaHU0dXVEMkZkeUJSYW9qMUlrNTdLLzVaU1ds?=
 =?utf-8?B?QjBqMm9WOU0vQVpEMXJFbXU0Qmx5MCtEN1BWaTFIZ3N6bHZGOWdwbm4ycVlX?=
 =?utf-8?B?dndtaU5jL3NDekpySHNkWktvalFxdDZUU05iSTdiUllRYTRTajBtZFpaZSty?=
 =?utf-8?B?TXpTUzdNTUxYMTN1c0FnaXNxUzdpVHFXU3JsV1F3LzVmTUZQcFB0SmlkV0Ro?=
 =?utf-8?B?WHJ3SlB5RmVkaHFlQlU4TjRMcXpyYmhlbFpUZFM4SnhQUWlrcS9ReUpKN2tV?=
 =?utf-8?B?ZnBNNjVlR0l1RE1kMTNKOEN4NXQvenE0NE9IbGtXMmFNend2VUV4ZU4reW4x?=
 =?utf-8?B?NmxMcUp2QVJQclVxbkdEOGNNTVBRenlmbFhhZldJN1hnU1Z5TFdFazNRREJZ?=
 =?utf-8?B?WDRkZE15RzhpdVhMcWxEWExBZUt3OVdKZEYwKzFtQ2JjUUhQQzUrckxxTjJG?=
 =?utf-8?B?ZEw3L1U1OXVPbjZ5VG5YajBkMXpMbnJnQVU3OXVPR0t1Y0NKcDVBYTRNY3FW?=
 =?utf-8?B?WHN0NjJ3eUJNanpkYWRkU2NzNjlLZ2hCUTR6KzRXSkZHaTdWek10L09qUFB6?=
 =?utf-8?B?c2ptRzNoUnhpTFR1WVl4bTBaTE1ZM2VWSVd6RzZ4cCtlY0lhcDd3VWNuWEVS?=
 =?utf-8?B?eWhZQnA2VGxCOCtla3BtSGN0eEtzTnpkL3Q3SVVLRjZPYS9pcXdSNFpCR2dY?=
 =?utf-8?B?VFJOU1RuZCt2QWlONjRiVVBwUTY3ZmFUMytaU21PTVBCLzNUMlRSTUlSUjU2?=
 =?utf-8?B?UVNyR3Y1T2FuMS8zQ1BXb2ZjNW00S1hQc0lQdU9XanJwSXkrNk5JUm1SdGMv?=
 =?utf-8?B?eE5DMXNCOTM2MXJDYnd2ZVhFczhKNWsyNEhTOFVOLzJOam91bkUwcUVzcXJE?=
 =?utf-8?B?OU5vbFlXcFovM0dxRVMwTzZVUE03Qjc2aFJxbFVCaU4zT2pUOUxNVEgydjlY?=
 =?utf-8?B?ZWdDdHFUaWltL0NVV1paeVpDaVdFVDFuQmlwWldVMHd2QlNkYTYxWnVpY202?=
 =?utf-8?B?SmxPVHFaK3NONS9yYlg1eS9aZCt6Ri92R1Via1MxOGdNeEs0ZGViMFpvY3hW?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd38ebc-f660-458d-27a3-08ddcdce8f49
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 12:02:00.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNYwNF8r1lw1mUO3/+Bi149FzJPOJs4UaqMRvDZcg2SmjOYm+y6AYCNiYkwO9NkPwjFMCYiY2bV63L4pr3GakW7igJ65lXyxCvg82lFQki0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8108

Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
monitoring into the driver via the hwmon subsystem, enabling
standardized reporting via tools like lm-sensors.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 175 ++++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 7f473e3032e2..a3b28fc1a35c 100644
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
@@ -32,6 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/string.h>
+#include <linux/units.h>
 #include <linux/watchdog.h>
 
 #define PORTWELL_EC_IOSPACE              0xe300
@@ -52,16 +54,64 @@
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
+	.hwmon_info = pwec_nano_hwmon_info,
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
@@ -79,6 +129,19 @@ static u8 pwec_read(u8 address)
 	return inb(PORTWELL_EC_IOSPACE + address);
 }
 
+static u16 pwec_read16_stable(u8 lsb_reg)
+{
+	u8 lsb, msb, old_msb;
+
+	do {
+		old_msb = pwec_read(lsb_reg + 1);
+		lsb = pwec_read(lsb_reg);
+		msb = pwec_read(lsb_reg + 1);
+	} while (msb != old_msb);
+
+	return (msb << 8) | lsb;
+}
+
 /* GPIO functions */
 
 static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -204,6 +267,106 @@ static struct watchdog_device ec_wdt_dev = {
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
+		return channel < d->hwmon_temp_num ? 0444 : 0;
+	case hwmon_in:
+		return channel < d->hwmon_in_num ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+	u8 tmp8;
+	u16 tmp16;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			tmp8 = pwec_read(data->hwmon_temp_data[channel].lsb_reg);
+			*val = tmp8 * MILLIDEGREE_PER_DEGREE;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			tmp16 = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg);
+			*val = (data->hwmon_in_data[channel].scale * tmp16) / PORTWELL_EC_ADC_MAX;
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
@@ -243,6 +406,10 @@ static int pwec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = pwec_hwmon_init(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -275,11 +442,14 @@ static struct platform_device *pwec_dev;
 
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
 
@@ -287,7 +457,8 @@ static int __init pwec_init(void)
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


