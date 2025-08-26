Return-Path: <linux-watchdog+bounces-4064-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD7B359A9
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Aug 2025 11:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2613A6549
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Aug 2025 09:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808C33009EC;
	Tue, 26 Aug 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="W3i6wVE0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022107.outbound.protection.outlook.com [52.101.126.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D82882DD;
	Tue, 26 Aug 2025 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202314; cv=fail; b=uKxou4VzN/HKd3ASxKruqHt7vI1SAyRi8MluvGHlir7JScpOz6Co46YK/WNnPLKGLn1KYPeUr57nlgGKzVP9Onah01qiL3ETposdzowKY8k6RjGq6o8o4hxMGeg4Hsj3fJQ61nxxylTiWwoMbybIWcAzfspon1yVk9yWClCaV+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202314; c=relaxed/simple;
	bh=ofzoVLLWSnATSZyvixI8OfkGyPUKqWWy66yWTI+Modo=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WufaA2o+TKVBYgC518COpZzFqJJX3LJ8VolWxC2yzLpYetsjSMx6mF+8Yj1avceGLdum5egMYfnjTPFXt70xbDzZHIyoJiG525O+q8ULx/e+hffV9lh7f2Zs5CpYg4OGxARpYE/SR3rvAPY2s5DG7joQ4wSmO0+YVGrPxe1gfig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=W3i6wVE0; arc=fail smtp.client-ip=52.101.126.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz1d16owuTboLjgTLu6YO5IZ22n3jLvWj9CEi5OFwxSTLzWXAXt74PLfoEJx68Zl4CBLTpjdnieUCtysfRd730vmMAM0u1bqUfT/AZ9oROBdoYSpRZbxghwOYtDoN1Zyb6s7nO4vP2I/UxqMNdDs9BRRsATMwc13IcOIkuZYBc/a9Jn1eorm5vcxOeVMnqIY2C0jPl7KX0flGGwL2IWYmaxAHj7t7ZUVD3eW8uIJvTJNsp/qUS14jskNX4IStDTu0vK+j/hwGT1NrdknHILGDATjbAb/SaGEYoTV70jqRMykUQHAvjPQJmbTtqdCtUALLh6lKphypwx7y3jyjsp7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDwGlcs9dXFR08WzcNDTxNyiRPgPRL4Ox1BWIUP9zHg=;
 b=cjSVv1/Tyiuh68Tmubxx2h+kp6AC+X01WL/EZ26Ma6N/XSOHKHoDT+p7J5Sb5zu2EEHcH+jK/zP4Ty3A8bS987gjsOZnR0UeSqQIb0/4V+gocd5YdEhAMp3dBid1UmaQuspZ5t8SeCjKL8sKaIAFNacUdILy+RDWx/AC5UBsoNTQKeYiVmGQ/yq7XQdPpoN7angLKzq4Y8igWDASb1XEHzjEDvpdewnKQNvVIjxl6tnc9FsqZMcusJ++LxXzNV0xVPQXV9QHXF5nIcZgRcY4jsLG8eKYAOr/hfdvRA9jK77vnbtaghwCWLYzagvrnWfTuq7GW1jWioPoDYvey2rUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDwGlcs9dXFR08WzcNDTxNyiRPgPRL4Ox1BWIUP9zHg=;
 b=W3i6wVE0+55G0PYqQPd/PVpkHDFvLcmlbTfHx6Gzgdapw38yIW7wSnvXai/12RJRYEtUTLB9V3BvJwVEDroQXnYzNYCfF5szUeUcFseisbiyecA4WnfbE0+nEA5auEW3M87RLhvi4D7Oatpv+1MRj0N3WO9Z+0aOeXKIClhaZOY289CCsncPiUA7CbCCTinBR+iFr0yU2UCVNkCet6FJwwSDgqilbiwhKnoS6UHJigROiLw+JsOCb8v3l6uhnZAefx7IllzRmLnBkWQDjPW1iyboXFUrOxinw9QIT/d/Nb+aI55z9QpDNpn6ZC0s9TXumdFWoDRn6NyC6/Aj2QvN1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYSPR06MB6411.apcprd06.prod.outlook.com (2603:1096:400:42a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 09:58:28 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:58:28 +0000
Message-ID: <8d1df04e-11fb-492e-b9f1-5c0816ee2a41@portwell.com.tw>
Date: Tue, 26 Aug 2025 17:58:23 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v3 0/2] platform/x86: portwell-ec: Add watchdog
 suspend/resume and hwmon
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
 <24439698-ac81-43b5-b808-e912954f573f@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <24439698-ac81-43b5-b808-e912954f573f@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::17) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYSPR06MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f60fb2c-e8f8-444f-9d38-08dde4871ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWw0a1NVN2FGUXUvekRyOWlxeCt5UnFQdTNqeVJFbTlQZTlFcWxsYyt3MkZu?=
 =?utf-8?B?emNtdXY4NFNPRjdTRjYwNzJxbzJueWtOU2c0S2tPZmZVbXFCS24yT1kwRXUw?=
 =?utf-8?B?MmdOVU45elkrU2s4M3BCd002azV4MFJCTXpwR0JJQkVMTk9oODcxUDVONStx?=
 =?utf-8?B?clRBcEZBZUJWU1d2NnA5dzdpaGRYQU5IRkpreE9PaDhXcThNY2x0VXV0YzR6?=
 =?utf-8?B?eC9zQzRCUGF1Z3cyRmlmTUZJNWcwSmI3QjZyN20yNktMVWkwbHBnclU4eWZo?=
 =?utf-8?B?eWZza1d2QjMxdUdvZ1JUcVRncEZBait3a1BzY0ZkUUtrVGhDdiszbCsxbFRi?=
 =?utf-8?B?azNqYkxNZzlpVGFRZ3FVbmhlUzBKRHdPbE5PenRiUFZvcC9ZVUMrdENQdUd1?=
 =?utf-8?B?cmplc1ZHVGFqMUc1dFAybzExVW50dzlWR01wdTBHc2ZOdm50NWdYZy9ZdjBL?=
 =?utf-8?B?UHFxanJNait6QXZhRWV5M1VYSUdIZERGUGJ6elpocmlOd1MzcFBNVDNSM21R?=
 =?utf-8?B?SG5Hbi96NTVMT0ozNTBSQ0MzVTFyZC9XR2dzRklNa01zNmJCOGxWdXhmNmlJ?=
 =?utf-8?B?STZkTFBLaFBjNTlQNVlBVUU2Qm1JYTd5N1FwTVZmZCtDVVVoTnpMSWRiZ3Fz?=
 =?utf-8?B?cE5pWndOQjBoWU4yTVFONVZtdCtBeHRvT0hraHZ5WmNkRzNLVTNtRFNiSitH?=
 =?utf-8?B?ZHJkVXdqVmJka3pHY3dYdEpXbXMxUHZYZlo2TjZuUWJYK2pGNElVTkVrRzlP?=
 =?utf-8?B?YzF3UFFIdW1WOFZ4Y0VoN1pvMXdNODAwcnFoZnZWNzF2KzhhUDA4TGF6ZVll?=
 =?utf-8?B?Q05ROVl2bDRXZWRrQUZTVm45NkZMOFpYaTRnZUN4OFNBYXVmaHorcWpQb3lX?=
 =?utf-8?B?cmtrRDNuNUloazhZcVhudlk4ZllEYy9rMlhteDA1dFhtaGxhTS8yT010TDd1?=
 =?utf-8?B?VVBtbW8vRjVZblI3eDBEZW0vYm1kZjU2UEI0VlY5eHBJbWcyRy9nSUpwWWsx?=
 =?utf-8?B?eEhJQkJza3B1VmlST3FLTjdXMkM3cGlhTG40S0k0MkFYdFFlMUdJOHV6Yytx?=
 =?utf-8?B?cU93YjEyYlFFdHRCZm41VHRmanByeC9jUXZKTUpuUUxoemtsMEZJdjRJYm9F?=
 =?utf-8?B?VVl1TmE5L29tSTAyZ3g0Z2pJYllOUkhEd3U3dkYzelp6aDF1dTZPWlZIVksv?=
 =?utf-8?B?ZUNLRDMvUjNXM28yNWphblVyZDFVeXllQXZHSzVaRk5OLzhrVU1nZkxnb3E5?=
 =?utf-8?B?WG5wLzRsWkZSSWhzb25qOFNKQmQ3S0ZtdGdpVTFiZXRoQ2ZJU09YdHZqbmpm?=
 =?utf-8?B?dnM0VzdNTUxCSTdRclFhRUh4ak5hdXUzOFFOZ1UrZVlxaWhsMzZaVmN0VjBi?=
 =?utf-8?B?Tm42RTZ5eXBkRG45T1V4VkhVd3pyMXp5ckNoWDJlMzcrVmdFY3JKcEd6c1NX?=
 =?utf-8?B?VnVydHhHTGc3UXNzL3NlN1JadlphSDhVNFl2b0ZRVHJKek90aXl0ZW1yUlZs?=
 =?utf-8?B?ZWNTd284YXNhTzliREE4cjlnUjQ4TUtJM3hkYzJGam1RMWtzaTNvVDJ1a2ww?=
 =?utf-8?B?S1ZDTk1rbWNDa1I5ZUJPeVZCYWRjN0I3M0lJWUVGS0IvbXFqOGtwazNkVXpm?=
 =?utf-8?B?OFJ6cUZxZnpveGxSWjc5b0NKR0x2dktqTDNiVFl6cVIwZnBxbU1qckdGOW9p?=
 =?utf-8?B?bDdPYjlPRk1DVS9rcC9GUVFNM21EcE4xdFcwTVpXUVRNYzFvQVZ0YzBIb3pW?=
 =?utf-8?B?SGFxRm1CRHpuSGhVdm41bHZ5Mjg1RThqRXMyazI3dkd2WURja2YzMXZWWHJP?=
 =?utf-8?B?M1pJaVJKRHRoWVhBMnl3MC8zS0gvRld6ek1oSlg5U2Z6dEg0N2x1VnF3Mzl0?=
 =?utf-8?B?ZnNPRFJWcGZtSzFHTFVxeHd5ckVXd0FPU1lIaWc5N2hLUnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEF4WkVuSlVyR3FzMU5KcythcTVScW5DdVdXVDhjRUU4bFdzUlVUNWIwWDNt?=
 =?utf-8?B?bVJtSDl3NXcxQUk4cFg3cWZ4dys3OVA4YlVNdysxcFdSVDRGK29ETlV4Kzla?=
 =?utf-8?B?OW93RzNCOCtRL1R0SHRWK3ZWRlJsRUVGNjYwRUZMMHY0MytmbkQ2U2FiVlpi?=
 =?utf-8?B?VU5sWnAxcmVOYjZhYnVGVktyOWdrODhoOVpvenJWODMvUEtqTjN2ZnkyOE5v?=
 =?utf-8?B?UnpKdDdURXE2elZublkwMEZ0a2ZncUN4UHhiQXo4UUxROGRNM3Rmc3Z4Z3ps?=
 =?utf-8?B?RjF6eDNHdkd0THU3NFZzeVR0UzJteDcxTzk1N0hMZFR0aWlybHYwcFRkeXVw?=
 =?utf-8?B?SmtPMnNXV0h5WEF0TjF1UzV1dUs1bncxZlgxNlA3QzdYQWV5dVJvOTlIQXpk?=
 =?utf-8?B?TTFYaUFrSk8yNkxnS3hxQnlhNEtsMExMUTB1aUQwY1A0WmROUG1TOGdFc2JC?=
 =?utf-8?B?RVhqRmszWEE3QSt5cGU5UWFhWVNFQTFJMXkwaDVFUEdESytBVjdXaUJwMlhu?=
 =?utf-8?B?Ry9lbVNRY2ZGZkJlS3VpVzRQN0Q4WWpJK2Y5b1czRU44QVliTFZSMDJnclhs?=
 =?utf-8?B?VTFCNURwR1dmVXBmWmtZOVcrb2ErWUs3WGVSenBWZnMvQ2g4VFN2YnFNeVBP?=
 =?utf-8?B?ZzBpc0JId2pKR2lTRjRKZnYzTDRXeG1BaS9Cb3dOZXdpSUhpNUdXK1dhOEEw?=
 =?utf-8?B?TjdLcWd6cTR4WFJYVjh4cDZrajErYlgzM0tvNHhDczJ4aTd4bFBGSnZlNUJM?=
 =?utf-8?B?dS9IZlNvc0QxcW9sTUZlMzlOejQrWmZwWmFUOVFBSU5ubTdyaWtpT0JaN0pC?=
 =?utf-8?B?L2d5VEpLNEpoMGJ2T0V1ZTh4bEpHK0ZXR2ZaUHlZQVhLRG11Wml4ZEkrNTVs?=
 =?utf-8?B?bHowb0ZqbjhrYkYzeXYyOStSemhsWVlmNkJNTjVSeXpZNXdyVTA5ZGg0OHpO?=
 =?utf-8?B?MlVsZkpRUFRqRWtPdHpSKzNoV0RnUHZrZ0FzaUJqK0drR0w5eUV4LytmdUN4?=
 =?utf-8?B?NGtJTGIxQkdHV0ltSmxhRVlLSmtCQ21YTHZRYnpzbVkzVHN6VklyaVlVNVNS?=
 =?utf-8?B?NHZNU1ZFR0FIb1g3N1ZKODBoVlRXU3hTUFFKUkpZdCtBaEIyMEgwSENISXBi?=
 =?utf-8?B?WXVrekVkTlA2QXM5cHJFRFlJbHhUTGhHWGo1SnBzUi9IajZUNThhajN4alpj?=
 =?utf-8?B?bk5VWE5ZZWppalFYTXI1ZlYzSFAyNWJUUjRpWitXNWJLek9Ec25pOEY1ZS9u?=
 =?utf-8?B?RytBVFVTemRYekVleG9yUGJSOFI5QWNtUW0rMy9XUS9zRVErMU1tazlhNXRt?=
 =?utf-8?B?dFlINWFFVWhadmVyQkIvaW5PUEQ2R1E0b2lBbk1SS1V4UFJKbFJMclFncExE?=
 =?utf-8?B?TC81b3ZGSVpTQ3cvWFFyR2hnSHExUFFXOFZFSXFCWTFSdHgwRlU1NENSWUNu?=
 =?utf-8?B?Q3ZzY29OMy9qU2hhOWJzb2RvakhkMGo1SXJXTUJYVDUxMU4yb3hWRitUS1Mw?=
 =?utf-8?B?MWtDZHBMREdVMm1Fb2dISjFPcGpVZERUajg3aEF0cXpPK1ZPbEg5Ujl3aSt6?=
 =?utf-8?B?Y2djMjNXWit5cEI4NU41UGxMdklrRkdTMDY0a0pkMU1kNmppTmhTNVR4Q3Er?=
 =?utf-8?B?TE5YY29DRWMyV1gyUVg5Qjc1SU4xVmRnSUU0N0tYeExnV2pZdTg2S1ZWR2xz?=
 =?utf-8?B?T0JzdnFqTkYxSnNVc0FkckoxbkhSNndod3RpTGpFOE5kRUQ3d3VvcWtKeEkz?=
 =?utf-8?B?eXM4R0RSdWp6Qzg3byszVkw1UlZaU05OMk52U0lsSngwR1pTeVd1V2tmVnEx?=
 =?utf-8?B?VUxsSlVhcndDdGthSlo5UXJ2LytFZldyclRWYk5keFJGZ3lQeXZkK2hjL3VK?=
 =?utf-8?B?L1kzdGZGMFdXMVFycWErSG1mNjZ4ZElPSUF6enFQLzhaTUwyckwvT0I3QWsv?=
 =?utf-8?B?akNVL1YrOXVMT0xzSW0xbzdsR1lqOCtQOWNMWUszUXlMaitwYk9oYlRhWTRC?=
 =?utf-8?B?VUh2cWtrU0h1Uk5SaXB5TnZqQTBzaGprUUt1b2t5NjJxWDJCUTgxMU5jdnZy?=
 =?utf-8?B?aFAvcHZ4OTd4WDV1Rm12a1FoNjJwT1FWTngxKzdJcmxqMlhpTnczSEpseVhL?=
 =?utf-8?B?OWpXTHNPNUNnejJ1SFplY0xPV0lWeUNObEFZTFF3K3JBZ2toVkV1M0x1RWt5?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f60fb2c-e8f8-444f-9d38-08dde4871ae7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 09:58:28.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10NUC2arLOr3/ly0p8AWL0Az/qZl9JaivAz3WSU49QJC6QFt+tc7gdYieHsPGlXBBgyjmVYQJ7y3ggkT/XK2vAj1V4uwiL/BQffRPrDagN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6411

Hi all,

Thanks for the review and feedback.

To allow the watchdog suspend/resume handling to be merged sooner,
v4 will drop the hwmon patch and focus only on the watchdog changes. 

The hwmon support will be submitted later as a separate patch series.

Best regards,
Yen-Chi

