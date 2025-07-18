Return-Path: <linux-watchdog+bounces-3884-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C8B098DC
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 02:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25C7F7B4D8F
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 00:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA7C5695;
	Fri, 18 Jul 2025 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aGav5zmN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533D4C6E;
	Fri, 18 Jul 2025 00:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752797984; cv=fail; b=ZXOm5+vc1uSCsn4Zy7xP1Gs9xZae1O+GL033auigXRvb/LX89guHja4o9beU05lrvtYQOQAIIahhCZM/KqeC5HEaViT029lwIdqQa9TOkseCJCjndQpqiJtut3BjT/DS0eo6SqphvKyiO4w6EX+Vb9+cT+Aqh/AIhConZztUj8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752797984; c=relaxed/simple;
	bh=0fo2GEB/NDnS3tqnLqpKn1x2ga+hySQ3BaaYCUnzseU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SHjCm9GlPbjKFoqphtCITItxMe3QWsAHpkGMLSh5cHxrvcYEofb89ZHnyQz1noHYTXkWDFlPjMCJvQby67Si7uf6VcMbdxwQrFnQOKRHwUDsi/PP+kye43EaTVIXXCXNGFJnvFG2Aty7VMf3YC7zMnXiy3bxM0SKVtQxyvvPUGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aGav5zmN; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJO895TDL6apzKBbB3An7mWb5TRUrW7bqhH/RlK33x5BrRbcJq31sgzgw/pPUXBNjpqTvkrWF0oJ4xhtT62UeBKFlfLCmERV46zTYZBYxxp/U8chSCRYIIWJiVyckRiMB2zvqVnUpA4vEVaC1cYRapYRGExvFuz1XcuRp4OZ2J2wNFUJck3JTjG2PJjPSv/hyf1cnmuzMAmvo0FosGpb4kXIhyzJWQhmGaVZVEuKb2YLUrNd+0y7ZNWOqH2L+Jm+nDPG9WvEoDnEiW5gIpkpBuosxdow2T4IHRDbKITIG39o79LjQaf9pRjdcCraOQsY+0/xt5dZ+kn4jIM1/Mfttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrHAoqOzaQ9Pr2Cw5wC02ebBaIxVrTQNFdBTTMeqAyE=;
 b=iIgQ+OJwLH9+EKLN22IpNOI7SYsOJ3gldqGfaZwuXKJPU3mXCcOnec41NztgotW5Cq8bsnA4qjemHSEQ4vZi/5fl2HAAZU75oRl2fVHBCIwoZ6rOFgvLSNTK22XyUplyll/HVzRhf3fZw0LQ2EpBnz7QloGLzV1IXe+L4fsLQw+j7fkSBHbcyAHEZpKoHdljmQhK/r4a43IC5FpuK0P7f6EXkMLlcL6nWTaLGLrvuVIw9Um3z8BIGodNxUMC+tlzfnYFnaRdVphkL0af51JDjOyGhbTmY6Bfi5L39fshy+XsUVruYKwV/Xoo7nwpHG5EXlyjXtw134Vol/PLZQ0lEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrHAoqOzaQ9Pr2Cw5wC02ebBaIxVrTQNFdBTTMeqAyE=;
 b=aGav5zmNGpBl9FLy7HPQ99GLJHmQicQ4Zl+w4eyGL0kVHvRZFn9c1kCK7rT0461sr8wsybopGQCUjWeG51HXeQZ49sPSxcuAIoy0kAeJNlcs4vi5V45wx5qwLOkPOGT2KW+p5q5nhp1uoLKfuh5ErNpJjXMfVU0khgtpDY+BT0plCofLbIIlGAoP9bUEzDfve0NLEVaGkx6OgPqpwQBve0BsbeVjSwgUe7xMlnqsNxIF/AFZnA0PyLzBFSClr4aMl4AELxR0BdUenEBL8+t3+F4QLtVDYZAtQJGuTxNXaYAYWDypv+eWauZW3nwO1wZGxxlNgMVMGWxTAT19bXYfgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 18 Jul
 2025 00:19:38 +0000
Received: from BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f]) by BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 00:19:38 +0000
Message-ID: <cbd0cd0c-83d9-49db-9e84-a8807e6dce75@nvidia.com>
Date: Thu, 17 Jul 2025 17:19:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sbsa: Adjust keepalive timeout to avoid
 MediaTek WS0 race condition
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Timur Tabi <ttabi@nvidia.com>
References: <20250708233354.1551268-1-aplattner@nvidia.com>
 <08cc0273-6c26-4ff1-b5fe-75235bca7a9f@roeck-us.net>
Content-Language: en-US
X-Nvconfidentiality: public
From: Aaron Plattner <aplattner@nvidia.com>
In-Reply-To: <08cc0273-6c26-4ff1-b5fe-75235bca7a9f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To BN9PR12MB5305.namprd12.prod.outlook.com
 (2603:10b6:408:102::5)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5305:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 66109150-ebce-4a0d-bda4-08ddc590c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2VKN005aWsyNkFRMnZVWURtRWo3WWp0YW0xSTkrVTl6TU9ld0RWeUVzcXh5?=
 =?utf-8?B?TXVMRm10SFppNDhPZzE3YWc5NFBncUxRU2p0NEY5cHVSWjIwb1dTS1MxTHFn?=
 =?utf-8?B?VlAzeXA2clNSNnhmWHdmeEk5V3Y3WC83SVNYSm1wNDRRZXJycURqdkZzUWhQ?=
 =?utf-8?B?RjdiUEkzU0l2cldtNVg5aDljeXNDZWVRZy9RWDd3THlMVjY4UnkwZFN1N25W?=
 =?utf-8?B?akNPL2RGalEzWFg4UXI1NGYyNGpXTDFuSzRYZkc3ZFdpNmdqVnBjRDZhcU1t?=
 =?utf-8?B?cEhUMEhESFAxUHBkZmJ6VXdaMWVFWmRCNU83N1JrSzF6dEJubVBlWWdFb2Fn?=
 =?utf-8?B?eGFYbkZSZ250QXg5WTNMV21Rc0FYLzBFd256US94d3ZRQ1VxVHJ3cFJjSG4x?=
 =?utf-8?B?amNmektDUTMzQU9HK0MxUW9TVE0wTG5RcTV0bjBObERISjcySmRWcWFNNW16?=
 =?utf-8?B?c05UUTdjRG1DVng1T0JESWpCSU9IVWV2Y2psS1JKcTFIdzlDSG1WOHhCRTQ4?=
 =?utf-8?B?b2l0SHBQWEZnbUIyTEZIWHp0YjQ5d3k1eURWOU5UZ21mcnUyenllUU0rc0l2?=
 =?utf-8?B?cEM0QW12ZXJDYWhIYURIazhsRXMvbStKdUZtVzRFTGdSTXh2MmJmQjhLKzQr?=
 =?utf-8?B?MzVuWWNWL2tacGpHYzFmU2NqZTNNVXN2cW9Lc2YyYk5paDRNbllKRy9BaFdI?=
 =?utf-8?B?T1Nnd093VGhqbFdkNmUxRU5iU3huTXl1cmdPd0pmVytnV2hKby9mN3lZckVn?=
 =?utf-8?B?MUsrREh2MHl3bjlBbDQvNFZtVVVBdWlnRTdTb3YzRE55Yk1hRy94Q0g1VjYz?=
 =?utf-8?B?Uy9WVVNGbjFMUm9xVHRvS29uaUZ2OWU0cy9qSmZHL01UL21QVTVkN1QxK2RU?=
 =?utf-8?B?cDhxdHRDQjJIN2o0d0djUGZZdUVvZTgzS28xUWZoSUhkSW1seU16UFdDVUpP?=
 =?utf-8?B?RHN2dW04ZjhDWmlndExIRmhydmhxMlYweHpRS1llclZWOGhKV3VmOHlpY2ta?=
 =?utf-8?B?c3RwS3ExeVlJVzEwVks2YW5iOGpjUW1oZ29jbDJGSWlBVGlrYlB6a1VxM3l6?=
 =?utf-8?B?UFdCMllxYWUwZGhnMzR3bGhjK3hIaFFwQ2o4VjJCWE5BdUREaUR5U0F0SE1C?=
 =?utf-8?B?SzJ5VEtNYlFyWnl2c2JUZVhncUo3S21MQjFqdkdGZ0xOLzFzSXF1bFo0YjBJ?=
 =?utf-8?B?dDhRNDZ4Wkw4NTdqdXVCQkJ0dWs2YXFOQjkydjlJU3owODNZVkIxalNUTlFP?=
 =?utf-8?B?VVhQdWw1bFAyc2JJREFucCtJNlhObXYrSitEeGFXNXlrZk1aVWRlMHdUeklh?=
 =?utf-8?B?bFZNUXM0VUdSL1M5WXk5cmpheXcxZHNsUzVwTGRWZEFVN2lWcCtLV2xzT1dW?=
 =?utf-8?B?bVhiZzllTHhwbGVBM0hMd0xXSWwzdWdpMFZDRzBzWWVleDluVFlYdWRtMjBB?=
 =?utf-8?B?b1FrRERGVllwRGVJaE9Zd0dSWkoyVUVhbk9GUENJRXNUNytUTXdsZnlDQW93?=
 =?utf-8?B?RCtJcENQbm9VVGpSR2UxT3Y3eDVJcStacTNheDhhLzk4T1RJbi9aSFFOUURh?=
 =?utf-8?B?N3lLSFhuSjlxL3VhNG5XV0o0eUR6dFZxNWtVa1VRTEdBS0dSK0gzaTR6U3F5?=
 =?utf-8?B?OVM4bm45LzJ2RHZ3OHhxNWJnNUlWcW5JWlhTK1BlVDBLS0xyNXZwWU5lY0xG?=
 =?utf-8?B?aVEzSGRqT1hublFTVFZsalN4a3FMd0I1TTZxSmhycW1SUjRQVFI4amxtbU50?=
 =?utf-8?B?cTN1RVIrNEd2M1phNWcya3JMMjlZTGJtZTRiWm1GR21HV3BuY2FlUGNka3Ru?=
 =?utf-8?B?bXdYL3dJN0Q5RUZQSVFlS1VxZCtUOFZIZjcxTlRLK1pVd0gvTjlnRGFYSndl?=
 =?utf-8?B?MHRGdldzR3h3WklkcWF1anVEY3k1TlpWdzlkV3c4VjZ6TlFkbHhUZGpnWWI3?=
 =?utf-8?Q?0qj5grToCTU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5305.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0JjVEZHWjFDQU0yektldTVseit4RWtpVkV2Q1ZiVWQydUxDZlJxNUFzVTVs?=
 =?utf-8?B?a2Y4QVB6RHJ5TUQ2QkVaVTFZaHJQQXRRY0VERUtRSEVVQjJkNXVSR2RmRU5P?=
 =?utf-8?B?MmNISlBjeWtEd0JaaTFKTTlIc1I2YWMzcTNxeWN4SGZUdk1STGZ1K2ZYTXVp?=
 =?utf-8?B?WkJ2Z0M2ZG45STlmTmM2eW9iMkw3aS9ZOGhlNFhoUkdRZS93MGlrb1Jpaytj?=
 =?utf-8?B?T2tCSUVxWEFXVzlFOW8wVzFrWnV4TjR5NlVlVVFEU0pmeWZ3MW9nK1V6ODN5?=
 =?utf-8?B?VW5IM293ajJWeTBkc1pJK0tMS3hjMHorTmw5MXEvRGNEUFJNSTkvMkIraGlQ?=
 =?utf-8?B?NFdSZEVJNGxSbm95NG11ODZaT3VTOS9mcTlOTVZ6OGFCNzVCUzNaRzd4eEJ2?=
 =?utf-8?B?eHJqcURFWGJFcDRkZVRzNTJ5TzBpcm5oelhzVlV2WHArSGZYbGxsN005NHZF?=
 =?utf-8?B?ajBhOUhIRlFkN05KWGsxcjJHYkU0V1FHbkdRVFRuQTh0Q1F1OGhjNHFFdytK?=
 =?utf-8?B?L095dXhMSUNTelN2VjY1eTlESTZhbVRrNFZtMFhsKzVzUGhYaXo1SWxQOExQ?=
 =?utf-8?B?SGR5ZlpZRjFacmdmYTNlU3RPbTRYLzl5dXZ3b21XUEVaM2pGTzVHaWpzbXJG?=
 =?utf-8?B?bThpRHJVYitpU2dGQS9hbE9INUQ4ajVWZGhzQjdlaGpuRUt2UDNaTEZFZk00?=
 =?utf-8?B?ZXMxc2J1SGZ4RlpFVnVFdmtoaktFQUlEbXRqMERVNzZoUm5KdEJmY1lxOS9x?=
 =?utf-8?B?akI3RVh2Um9rekswcTc1U2VpYzg1c0g2MFJScS9DVkw4R3d6V1dkejJRYVVl?=
 =?utf-8?B?VjlxTEpta0VoVEh0MHliSE1hUVAvWHVhTXd4bmd4dUxBSDNJUGxoT29UWlBq?=
 =?utf-8?B?QTFRcTQvQU5wR3NXQk1laUx0UDhhRXFNeE04c2J2cXRMQytubVYvSnc5OENX?=
 =?utf-8?B?amVzNE0xMEY2RmNLNUVQa1RoY3Uwa0tWUVpQMFZvdDlhU2ZzMmg5c2lTcStE?=
 =?utf-8?B?d1ZPR2Y0cDJEdys3dzdlMEd2bjlueS9OQkxpdENYTDluNXF5bnBiN1Bwak9a?=
 =?utf-8?B?cEZOUTc1WEhldlptbTVOdmoyMmlsNE55bzBYaGJobUwwcGV0L1kvUjh6WHEy?=
 =?utf-8?B?MkRMMEpBd1pWTURqWkVuWUoyMG1Cb2lSRmlnT2d4TWh2ODF2WXYxeG5LRjBk?=
 =?utf-8?B?ajlLUW1pWUtMRllZZHI0ZHJtai9FUitNb2M5eUJMNjJXYTltZlZMNGNjblpG?=
 =?utf-8?B?YldpbVNRRjVOU2hyTERyRG9qbHdiT25YTmlPcUpPbTI3bnpSdHl1aHZXdnJ3?=
 =?utf-8?B?N3Q1T3ZtZ0l5dWJQMzM5TmU1c0dRQTM0NGx5a3hDZWFUeWltVTN0SWpZOXRi?=
 =?utf-8?B?STB1YUhNSXpUbElUaUYxaUpxbVYvT2MxSG1aeThtWWdwUm4rdTNNMTlaTjBj?=
 =?utf-8?B?ZTk1Y1MvQVhsSkd5Lzc0blVvSWN0d1pBSUNJODEvRGd6V3cwUE9URkkzNWJq?=
 =?utf-8?B?R3MxKzBseU4vVUFPYkE5TUdOTFE5aFRpejBuWGMrWkdpaEhNR2hyalVWWWpT?=
 =?utf-8?B?aHMrWjdkcnd6QTNnT25rayt4d0xYSUdGWm56VSswamtQN094M0RFL0JBZHFW?=
 =?utf-8?B?V3NFVHlEa3VVemhTMkl6YmZHMkF5eXo1RmdqakpDU245N2pIa01ITDQrVHZB?=
 =?utf-8?B?ZGJibjBIYmZ4ek5hWVRVbkJncUs3UW00dHk1UjFFWnVLMGNEaFRUV2pwQTA0?=
 =?utf-8?B?NVUvQ0RnREZXSW9RcUI5aFNvRkxyU05oMUJsSHhVLzdBSlVkenFQNG93S210?=
 =?utf-8?B?ekdBUHpLd2lJci9YMmZ2ajJCVkdsemwzQTNaSm5VSGZtYTJpTmVHRDFtQS81?=
 =?utf-8?B?MFgwUHNmNnVRSXNSWW5sVzJQOTZEY3hlamppdzQ1cnY2Sno2T0t4RXhUOU4x?=
 =?utf-8?B?T2NLQnMrOFFCLys1aFNqdmsxcVFRTGx2N0lmKzV1cndZL3dqYjJmK3JPVkxZ?=
 =?utf-8?B?M21KK3lFL2lqRlJvVXBFS1NqYWNJVFFSNFlXWWR6MnZxVHgweEFBakVHaVNX?=
 =?utf-8?B?dXcrTGRMd240TUF4UVZ5Y3RFdTlxNXpTb2VZSk4yaUIwZWczZ1gxb2J6QkFT?=
 =?utf-8?B?YUk4eDlqaWtLSFV4RVAveEhveWZIaWJOZzFDUUN3ak0zeEw5aXYvOFowV0k1?=
 =?utf-8?Q?BqgmIF+gDmXUnTDd9uYEcKw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66109150-ebce-4a0d-bda4-08ddc590c7fa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5305.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 00:19:38.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w5BjIsFtp2Ih9aXboWWgpmH2fZZkni7/ylW3XyPbwiCv+JhlE4gWFPqk7iSbYjjdcO8lCWjrfByRAb2bYji2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245

On 7/16/25 12:01 PM, Guenter Roeck wrote:
> On 7/8/25 16:33, Aaron Plattner wrote:
>> The MediaTek implementation of the sbsa_gwdt watchdog has a race
>> condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
>> the hardware is processing a timeout refresh that asserts WS0.
>>
>> Detect this based on the hardware implementer and adjust wdd->timeout to
>> avoid the race.
>>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>> Acked-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>   drivers/watchdog/sbsa_gwdt.c | 52 +++++++++++++++++++++++++++++++++---
>>   1 file changed, 49 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>> index 5f23913ce3b4..81012dbe9088 100644
>> --- a/drivers/watchdog/sbsa_gwdt.c
>> +++ b/drivers/watchdog/sbsa_gwdt.c
>> @@ -75,11 +75,17 @@
>>   #define SBSA_GWDT_VERSION_MASK  0xF
>>   #define SBSA_GWDT_VERSION_SHIFT 16
>> +#define SBSA_GWDT_IMPL_MASK    0x7FF
>> +#define SBSA_GWDT_IMPL_SHIFT    0
>> +#define SBSA_GWDT_IMPL_MEDIATEK    0x426
>> +
>>   /**
>>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>>    * @wdd:        kernel watchdog_device structure
>>    * @clk:        store the System Counter clock frequency, in Hz.
>>    * @version:            store the architecture version
>> + * @need_ws0_race_workaround:
>> + *            indicate whether to adjust wdd->timeout to avoid a race 
>> with WS0
>>    * @refresh_base:    Virtual address of the watchdog refresh frame
>>    * @control_base:    Virtual address of the watchdog control frame
>>    */
>> @@ -87,6 +93,7 @@ struct sbsa_gwdt {
>>       struct watchdog_device    wdd;
>>       u32            clk;
>>       int            version;
>> +    bool            need_ws0_race_workaround;
>>       void __iomem        *refresh_base;
>>       void __iomem        *control_base;
>>   };
>> @@ -161,6 +168,31 @@ static int sbsa_gwdt_set_timeout(struct 
>> watchdog_device *wdd,
>>            */
>>           sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
>> +    /*
>> +     * Some watchdog hardware has a race condition where it will ignore
>> +     * sbsa_gwdt_keepalive() if it is called at the exact moment that a
>> +     * timeout occurs and WS0 is being asserted. Unfortunately, the 
>> default
>> +     * behavior of the watchdog core is very likely to trigger this race
>> +     * when action=0 because it programs WOR to be half of the desired
>> +     * timeout, and watchdog_next_keepalive() chooses the exact same 
>> time to
>> +     * send keepalive pings.
>> +     *
>> +     * This triggers a race where sbsa_gwdt_keepalive() can be called 
>> right
>> +     * as WS0 is being asserted, and affected hardware will ignore that
>> +     * write and continue to assert WS0. After another (timeout / 2)
>> +     * seconds, the same race happens again. If the driver wins then the
>> +     * explicit refresh will reset WS0 to false but if the hardware 
>> wins,
>> +     * then WS1 is asserted and the system resets.
>> +     *
>> +     * Avoid the problem by scheduling keepalive heartbeats one second
>> +     * earlier than the WOR timeout.
>> +     *
>> +     * This workaround might not be needed in a future revision of the
>> +     * hardware.
>> +     */
>> +    if (gwdt->need_ws0_race_workaround)
>> +        wdd->timeout -= 2;
>> +
> 
> It seems to me that this is still racy. If the ping is ignored, I would assume
> that this is reflected in the watchdog registers. How about reading the status
> if the workaround is needed and issuing another keepalive if it was ignored ?
> Or just always issue a second write to SBSA_GWDT_WRR in that case, maybe after
> some short delay ?

The window for the race is very small, so triggering the refresh a full 
second earlier should be plenty of time. Are you worried that the 
refresh will be delayed by a second and hit the race window anyway? I'd 
have to check with MediaTek when it is okay to read the status registers 
to check whether another refresh is needed and whether we need to delay 
the read and for how long.

If it would be better, we can also work around the problem by doing the 
refresh *after* WS0 is triggered. We just can't do it at exactly the 
same time.

The other option, if you think it's okay, would be to do the refresh 
from the WS0 interrupt handler. I confirmed in local testing that that 
reliably resets WS0 and the SBSA documentation suggests that that's the 
intended way to do the refresh to begin with.

-- Aaron

> 
> Guenter
> 


