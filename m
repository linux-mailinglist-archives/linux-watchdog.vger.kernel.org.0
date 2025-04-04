Return-Path: <linux-watchdog+bounces-3200-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D58A7B7CE
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 08:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA5141782B4
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 06:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4040442AB4;
	Fri,  4 Apr 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lbCAyCRd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B2847B;
	Fri,  4 Apr 2025 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748522; cv=fail; b=aJYtF7ebMszXwIdca60rKjhNugV3C/4uS5GxjctMCTrsScJcU3oGBpqia53YAzAT3G5bgTJmotnoYLkgSfYuj9qastoCQgx/ubSRw5/TeSlUrxyq2zxJvhN2eWsPNumsxs8hN1MnHpMwY0ZVJRRXdIaedNukoghRPnsqFKRFddM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748522; c=relaxed/simple;
	bh=OU1pFpftHM3ValzmYeKmcyWbn1dYAAJtox4D1XCFiSU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GodIfzCOmgrDH3K5R6znM9pQRYXzYJwmEE/eOebWmbT6BAREtD5WuvoCT3wzWSdXCDLgFlBNpMmBXPEsB7jtUJh0OF+w2SchFcwMt57HMu5ClOnUbqYS19Kh0Kd2kfPgpoLOiiJ/lYNNPk0n2S9EBxbec76c+VW11YGd/epJqlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lbCAyCRd; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS2aYrQYPv7CqmYSTbcxlrpK/J2QJHoIKUyb6JigymCQIFMa7U9/XDlypgDhS6GxlTJXaZ1am2YPfPb+OWFJUcFgM+Nq+95Ndmju+a3nAE65LnjqkgMz25OBnyfzXdwPFF0AkA7LT0AiGVL4BMRfKbc5aMMOtMkGRanxwbX9WAQ+TOuqrZheuie6mqI9F/H5xjQ+ZS+up7N0BeoRUNxo4wY1meGoafiaspdIO4k+RoLQAyavIMD3D8xAQN2+F7MrLaZwraoxYfu+4UwCiygz2j9/lsUJjjq1X8xp5InnkNEKQYq91/jQHJnp945IEvqPf7070HJ00VECVBTakKwpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG8PwrogGYO4sp+OJS37+SAUnnvUXO9NQtgwnJnDnvs=;
 b=gojYidsGsdkH3w4r0qbwliWmD8slvW7HfgxcgfR5SOcLyC/x21cSIL0qyOAe4FX+xk1bMj4Z7rwnw6jK0C5K2dB6iVpaVmzSG4ie3ynoarlL+kD5TPRXurESOMfvxJkSqEcQEcrjgTq9vtHRrJTyomynx4gtRoFCAf8YGfLi3HnXeL5aG4qAo489qWjsxAmc9B2pV+jl15dxN4M2BIemkHj1YPYc8VILuy/7Nu3ea+rFu8OxWnMbAx4UZ5Q3xXRbrGvi4fJUoJqhVzKf7s8EXFgkkkxYXWeQCZ6q+oX/k3j/ugytvhlosWS9L/Fj2ptc23Fn+lfXAdlb7DtHXbP3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG8PwrogGYO4sp+OJS37+SAUnnvUXO9NQtgwnJnDnvs=;
 b=lbCAyCRdITBYgis6vn/pBI0Uf9fkQlO9e9lAejtOfwy1JGW9ijjC8gSqxP7pxon0JxaQKvrANgElivumZpvdZFvO3HNwMXvBNS3Q2mqxQ10xuU0KRO/DCvveMn5jZ9tf9NzFHeGXrziTdkOoJfuGhHMSV7YU4lZm+2qgQyhzRjFXIZr/WZgNXqyec2BwDOdAtVFQ+0Ss1Z3r/9jdt5Hj9CWY+7Ar758PjTLuh/SC8m/LJwhNGO8PeMNiKF8YPEVGRZ0f/Yq7JHqo6FsFMuSHq8fEMT9Vc9vRdKFA9nLqaMYh+/Vq3wlig0Wa59AQ7gXZA5VmU8M5q6xKSbkcp5RbSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 06:35:17 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%2]) with mapi id 15.20.8583.045; Fri, 4 Apr 2025
 06:35:16 +0000
Message-ID: <93d83df2-d3bc-e32d-70a6-158571504275@oss.nxp.com>
Date: Fri, 4 Apr 2025 09:35:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
 <c570c99d-53f5-4f77-a730-42e5a2016dc5@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <c570c99d-53f5-4f77-a730-42e5a2016dc5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::41) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS8PR04MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 87295f07-801a-417b-f5c3-08dd7342db7a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTluT1ZTQ0prUVNYaWp3dll5dktyNkhQbWxmcGlXNTZFNmZZQnh2VWs5NVE5?=
 =?utf-8?B?UlBoeHpSN2RLd1pzUXhlc3RrVnpnYzk1VTdIanNQc0JpejZ1bzZNYlFZOVI1?=
 =?utf-8?B?ZkpQOVJ5NnZ6S2tzTmxBeE9BaGdUT3NKQ2wxOXI2SE1aYlJIYmx0RHhJWnZw?=
 =?utf-8?B?OXBrQThlekpGNWtnZE5UelVnSmZKNkttelA2VFhQVkNldXdjTzNtdzdqeVpi?=
 =?utf-8?B?RExBNEU0eXE4Zk5BUENGYmZuR2xWYnhFck0wUjRxbzdrUGp3WlBQOHpjaE1m?=
 =?utf-8?B?b2NXTlBFQnhKdzVDYThuOXFOQkc0NW5wUDNoWngrQkQ5dXAzYkNQSzJ1aW9v?=
 =?utf-8?B?a3hkRkNXUXpGRVZvL0NzSlhielc1TWJVQ3QwNnQ2Z2xTQ2VKdzF2OFUzaHph?=
 =?utf-8?B?V3QwRkhjdTRZcUtFNDM4b1VFc1h3KzlBY0lXL0JudUdrOXQ5VnFKZjUwamMx?=
 =?utf-8?B?aGQvbmgvNkV2L2JKWlV4RWlwYjU4ZEtqK0lxZk5qM1ViV2YzaU5KRUY0VnNY?=
 =?utf-8?B?eUNURmdnUnQ0RzZvbzFqQ29YZ216VXpvLzRYbVVLUzVJVGVXNHR5b1dDd0hp?=
 =?utf-8?B?YkZSREtJeElIR3BmditadDUzWHJJano0YlVIenhhK0JuVlJWSjA4dHRKY05j?=
 =?utf-8?B?OElueG9pQ29OOHY3RFRnZG9TN0JKNVZzMDgxY2xFeG85bExrZmxoazNnSlhD?=
 =?utf-8?B?YmRKeUpLZ2pJT2o0U0ErK2F1bEtvTGRmcklvZnBNbEZlQzJQWVA2Rm9MSzV5?=
 =?utf-8?B?L2lZRmJKKzltZWJOZWZ6eTNVWVJsUjJwQlZNUDZwVkdOSjdzVEg4QkNwMm1n?=
 =?utf-8?B?aTFwYmlOcXNQb1BkTWRscHdDMmxlM00xMFhoSll1MHJjWjVZdDVTQ2d0U2Ny?=
 =?utf-8?B?di8rOTFPZWZZQkR1Y0VUdUh4N3NMZS9wWUpSSHZpTWxLNmlHUko2VW9BNVNQ?=
 =?utf-8?B?dWR2ZTlmMU5ySjhEYWszWlRyRkE3QjhqMFdMRTdYQ05HczY5am1xcXdoSnBH?=
 =?utf-8?B?T1ErSDNGTUdEbUdaZUl0Vy9tVzJTTE1XRTVIVXZ4SHpqc3dTOEpqQUZNUnJH?=
 =?utf-8?B?NmVJblpRNmgxSi8ybktkL0loVnNBTmtjRExoZUVxbnM1bFJONmg1YS9Kc0l4?=
 =?utf-8?B?Y2g4QWt2b0ZPRkxKY0hKUExJUFdqMGdyZUg4V3U4T3E4bmNOcCtXZlpyem40?=
 =?utf-8?B?dW5hN2JiZ2syVHBpajJHOC94N2c3N2NSNXZ5eU96QVRDVlc3bzlUckxpSE5C?=
 =?utf-8?B?dWNIem5BMW5UcUR2OFBETTlYQXF2aFNUYURmWmI0ek82ZklKUHdvQWVFZThS?=
 =?utf-8?B?d0x0SDc3NUZzaFEyc28yRDE3dktYTFRBcmN2T05pcW16a1BETlNGQXRPTTdo?=
 =?utf-8?B?dDQxdWtqNWNnbWVaK3RVVDBpTyt6Z3drQWZKN2J5L2MvNGFWMFNJZ0pmZWp4?=
 =?utf-8?B?Y0duSGhOYXVXVkpXS3NSTzE5eXFGeHphQ0NjK0RrZmQrMjdKRkNrQ09YeVZX?=
 =?utf-8?B?UUFBVnhTTUovZ3FRb3E4TnlCZFpLbFRjU2FjVXpjQVlEVUJLYzZmQWJSamp0?=
 =?utf-8?B?dDNlWm10cEd2cTVRUHNBZGpYZHJWSGR6Mzlwb3A1eHM5bitqRDdkSUNGRGta?=
 =?utf-8?B?ZTdUekdUUDhYVHpocVFlb3IxM29PcHlHNFBTNmxwQzRhSHZ5UGJTN08yUU94?=
 =?utf-8?B?TEZ4ZjE5WnAzVm9ESVp0RVpqdTY3U0FkcHBDZ0tNSjRNaTI5WXJSRUJVZ3JG?=
 =?utf-8?B?UmdYWUk1cEhjOC9LanJVV24wb0VuYTZPSjFmSEovU2lLUFNDbkkyMlpBcTk3?=
 =?utf-8?B?dFRmWUpTRzJQOXVFVlZDbTFDZERLSmRmV3puUlZkNkh2a3FQTFRYVUphWity?=
 =?utf-8?Q?YUVW3OOPkAySk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC9ZYUVBM2lsNXVDejVTMkkvOHZQalFQVGRWbnNRYjhxSitBYmNvZ2hGZFRX?=
 =?utf-8?B?djhwSjVhNE1TYkZ6U3NXWkUrWWlYUmdzdVh6WkI4M3NNY2lhMjV3L0xuR0xI?=
 =?utf-8?B?bzFsSm9yTmpJOXhKRGxnR2ttSHBoL08vYmdWYVByRjdLbUlKWW5odzUvNUtv?=
 =?utf-8?B?eTJ2UG9SbW1BMVVxUnZZalRjdHVad0NUZHZVWDdqSENHUTN4bGFpbGhRWXZh?=
 =?utf-8?B?L3haTVZHajE5c3BDNXkyWFNTU0RoaHQydGkrUkNuUDBoZ3kzUTZ6SEh6eTdQ?=
 =?utf-8?B?aU02QVl4YUUvTHdsUm1jUVZkZTI4MDZjVWFuOU8vdnJNRGQ4U0JEaExneCs5?=
 =?utf-8?B?NUlaWWZRMzh3L1Q1a1Ezc2dsS21BMnJjeFhIYU52YVpOeWdXTnZkZ1lJeUJ4?=
 =?utf-8?B?dFJnZk5VZWpXM1NSS1RvbkViOFBLbVBvRkJSWXJLeDh0WXJGaGgyNDJlWURF?=
 =?utf-8?B?bUt1QUNrT0dER0g0d3Q5SGpVbUJTNUJnT3dkb3hRM0JZeFJlcmM4U3dkK0Q3?=
 =?utf-8?B?ZWl6cVVzWDJIUmlVMDhXNGlnMXA1R2FxSFVMbWVKWWdMZmEwY3lCOUZxa2FK?=
 =?utf-8?B?cDNuaFdYOEJUaXBQSDJsSk5vQ0VYMG5ZbEYxeUVUaWhZWWhIWTZ2MElvbjQw?=
 =?utf-8?B?UEtqNzNlMGRvYkZLWmc5MTkyRGluUXFKRUU0dGpkQU5Yam9GVVBnMklJYldX?=
 =?utf-8?B?S1Q4VkdYNW03aTBReGlpNmtGK1RFSHZSUUFBbnNrZGRWenhXK092OXlHTkt3?=
 =?utf-8?B?dTI3bFB2VmRrb1d6RGxRSUZrb2dkeUptSVNjajlBV2hqdWZOQlltWHcyQkxE?=
 =?utf-8?B?YU1VOXFpcWZ1RXJuYnNCYm1KZU1icUlLaEVQY1NHQ2RBaW9yMWlXbzRNQkRk?=
 =?utf-8?B?WXpUNU9CaytIWjA0UnFsMkJwbVh3RjczM1pqWEFjWG00VlhnSU1RQTY0U0ky?=
 =?utf-8?B?TU4wZzV0L21JRTZFa2dKUDdXcTJ3ZDNrSjdGL2paZDBmeFNvTmZQQnErM1pX?=
 =?utf-8?B?MmpIbk1JWG1GcUF4NlAvYVlwVXYvcHBCZ2Z4NVNkbjhxVVVKYmJTbXgxSURC?=
 =?utf-8?B?dHdHcUlhZ1drTlhjc24yM2Fja3RwSU5BQWhnNklqZmZSOHRKR1ZwdWg3SThK?=
 =?utf-8?B?cjF2ZmRpR1UrMno0U21lNWluSGVsMnB3OXpPMUIxdDMwQXJIeXV3ZFVackJa?=
 =?utf-8?B?QWFGcWZXR2QyZXpQWUNXbnhEZS9nN2VOcU9vVDVQTjQrekFRSEpEZWR0STBY?=
 =?utf-8?B?bEhnbmdPRnlYMnZwK1dTTW53WlV1cDlKZFJCSjVnSUNGMWIyUFRxM1Rtdjg2?=
 =?utf-8?B?ZDh1QWpId0hJVVcreTNIMUNqS0ZJODFob3BtNWpUenZuQ3JJV0g4dFF0MmJV?=
 =?utf-8?B?aTA0NXRvNzJWUVhSTmJuRHU3NDF2REZ0R0NTQXBhSVlqZ1dpQURhTkxlKzhE?=
 =?utf-8?B?dUtYN1YxbUY3Zm9TUHo4S2h6dlpZSzFmM0pJSVcvYW82aW4xR0h2T1pJMmhz?=
 =?utf-8?B?NW13RGZscHpBSTBVUHpGUk1UTnluWWgybUFHWDBic3ZqTDVwaDRhLzR4ZzVM?=
 =?utf-8?B?QlBCa3RxaEJqdnVVMWlyejZtUUVLWUtQUGQ5ZklzZFVlYm5tRUI1MUpyWXlm?=
 =?utf-8?B?SDJJUnNLcm1PbE9YNE1SbTd4U01FWUhMUG54b0FLQlIwK2d3eWoyalpwdU9K?=
 =?utf-8?B?alpLNGNSUWxIb1dKYmxIYUdCZGROQ1JvQm43dG85dlhaZ3h4UlJ1d1puOVNw?=
 =?utf-8?B?WU5Dc2NXMWZXd282aGVxMm5UV0dHNlhINEFMWmVoL3ZkOURKU3NGNVY5aXli?=
 =?utf-8?B?NWpYTWhIUkFqZTZsekZGVDU0Ymt5QVJJZE95SVZPcUZ4Mmk2YWRVNmU1Nk1Q?=
 =?utf-8?B?d1YybmhHd1RHWkJ1WEhxQ2xrY2lKdlNlUXFGU2F4aHAwaUhzNDdOODE2ay9N?=
 =?utf-8?B?dkZMTlRuNGE0OHpDVlFOSGYydy91SE9GaGwwbWZUQ3I2QjRReFdlclNZOGlv?=
 =?utf-8?B?bzRuMjJiRXVBbFQ2MjJkTk9nRFhYa1cya1BXbFFDNmlQdVRsQmVmWGdlbEN6?=
 =?utf-8?B?K2VMS3hiN0pqMmpIRDQzQ1JtcEE0Mi8rTm1LMmsyN3RrUG02VTNrNFhoSmVP?=
 =?utf-8?B?a2p4aDlpUWQ5eXptWGZvVDhZMDBXZ25RRzRBZXVvQmpVSDVJOGxMcS9CVURS?=
 =?utf-8?Q?5WQf4xoQyBlyq21IXyqYDT8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87295f07-801a-417b-f5c3-08dd7342db7a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 06:35:16.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4/ghfL3KEdnmkifGI+aYkDLWl6fXDowtFK6/SzHDGgB7NBwHWS0FxbM4qYyzN53YQt5lMc8lo+TeNuKCClT8nZ7svFDKUlkj5Na6zpuqik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676

On 4/3/2025 6:10 PM, Daniel Lezcano wrote:
> On 03/04/2025 08:19, Ghennadi Procopciuc wrote:
>> On 4/2/2025 6:49 PM, Daniel Lezcano wrote:
>> [ ... ]
>>> +examples:
>>> +  - |
>>> +    watchdog@0x40100000 {
>>> +        compatible = "nxp,s32g2-swt";
>>> +        reg = <0x40100000 0x1000>;
>>> +        clocks = <&clks 0x3a>;
>>> +        timeout-sec = <10>;
>>> +    };
>>
>> The S32G reference manual specifies two clocks for the SWT module: one
>> for the registers and another for the counter itself. Shouldn't both
>> clocks be represented in the bindings?
> 
> AFAICS, there are two clocks as described in the documentation for the
> s32g2 page 846, section 23.7.3.3 SWT clocking.

This diagram illustrates the module clocks and their connections to the
S32GS system clocks. From the module's perspective, there are three
clocks: MODULE_CLOCK, REG_INTF, and COUNTER_CLOCK. Specifically, on
S32G2 SoCs, the first two are connected to XBAR_DIV3_CLK, while the
counter clock is linked to FIRC_CLK. Based on my understanding of the
device tree, this configuration should be listed as follows:

clocks = <&clks XBAR_DIV3_CLK>, <&clks XBAR_DIV3_CLK>, <&clks FIRC_CLK>;
clock-names = "module", "reg", "counter";

Configuring it this way allows flexibility to reuse the same clocking
scheme for other SoCs where the integration is performed differently. It
is possible that the 'module' and 'reg' clocks could be linked to two
distinct system clocks.

> 
> The module and the register clock are fed by the XBAR_DIV3_CLK which is
> an system clock always-on.

XBAR_DIV3_CLK is not an always-on clock, meaning it is not available
during suspend, if that is what you mean by always-on. The SIRC can be
considered the only always-on clock on this device.

> 
> The counter is fed by the FIRC_CLK which described as "FIRC_CLK is the
> default clock for the entire system at power-up."
> 
> From my understanding, we should not describe the XBAR_DIV3_CLK as it is
> a system clock.
> 
> And the FIRC_CLK is only there to get the clock rate in the driver.
> 

-- 
Regards,
Ghennadi


