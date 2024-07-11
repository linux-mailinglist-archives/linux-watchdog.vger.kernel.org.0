Return-Path: <linux-watchdog+bounces-1360-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F592F22C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B861F21A3C
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1EA1A073B;
	Thu, 11 Jul 2024 22:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BTYTbexx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013045.outbound.protection.outlook.com [52.101.67.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C91A0725;
	Thu, 11 Jul 2024 22:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737682; cv=fail; b=d8vKBwEnRAC+j1uzhGR/sTvVMq+KPWWo1mjNe8XLuczPnzadgkapU2a/+D997qkwQikeSKggMy/9grF8Vt9ikQfssnGKPnDnBXLDytG4FhGsPt1O6yV0yd5GGnsTu7Q/lvXPfsyAq/6VjlAzjHtJXlTo/Db8xAqo2INkZnV7zoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737682; c=relaxed/simple;
	bh=DFOXEwWwhVGoGY4z2uNYzuXakElV5cQsTVvxwmFcXvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YKcSjYjc0A/vQJTfCLtfSoXPcXoWNsO5eUXDdYHUnZYxAlFrNxYr4i17vf0C/+pH1sL8MDPkTYFa2f6+1oRlL+xz8NGQlNKOUZSBucN9mLboO273hncztza+DCMP2ZdYQTaJr0fJqqPinv8mi5Aj0U+IJmDGfJvuVaclWpxz2oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=BTYTbexx; arc=fail smtp.client-ip=52.101.67.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ocy8sGdOHorbdXYF9nhYSvJOwo+QhKbGmvXEZhOHHPIgaJjYIRruHX9FPqexgn9LMqVPE5EY6GNbgUOpzmUYgt7MBLSNJFs0bcTxJLODJax7d9aA1vDOC49TaOta4VzZ0FiO//DQdTHX8DL+36rrLX+TC9A117j9EGis1EcBgpaatTTALPRDXF6OdMhdNBrscLuLLISv6t+ciaUz2zuqbPSmQ2UYfO23N2Tc3vqCBTITXR42eiO3Uv5QCoig+XpFB3x+4the30vJiT/Ez62BOm5ltN0eCfBvxX9/BxRkn2V01WwDtSEW3mjLhQ6erWRKm8+WQCUEY2Kf6H4jr2cRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGEO0X+yTJspKnXFA079pHwG7SQGO0BdJUz1uVYl0wM=;
 b=VkFZO4Y4lncXOL6Q4IB5x56qW0g8aSquRqSBicYcX+KfvGD2fMdfcGA2n0Piyq12K2rSHLWp8Jbx3gBB0tPT9QkXK+jM6CWZsbDralmTUkNUo3GX+i+1oiCyX4TSVs2ORnm+O2lMYSTi4QPr3C/SnRBL8GucMVgQonrpM6cNQPjeYkNBT9/rV2NbW7wQy7JcEDWR8nH34n5+Ak0rCVY4COxV8rZj/nrPGn7umzXtUDtqYjDNnD7iuQxyG9a87tJ4dK+7UZFJ8RJnnzteOJISC1GaFDDDyOt6GAZm2hy2FaOwJ9eeX1D1MLjqgtvwT7uXmuwVkGy65zEYV0KkkMV3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGEO0X+yTJspKnXFA079pHwG7SQGO0BdJUz1uVYl0wM=;
 b=BTYTbexxOY23Lw0YyiKrkaiMzKrxT8oD+68sATk+1hGC8lDO5vTx/av3FKMOP+5PlDEdwOBcgtmXUI60kxKi5FsVMSHFyqe+LP86oZbiZa4hnsmCGjQn7GZnIn9zPLjrz4fNW8BhM+pyXTKZEsPZ8W97LATadNKvynGvtWWNGQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 22:41:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 22:41:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 11 Jul 2024 18:41:00 -0400
Subject: [PATCH 2/2] watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after
 RCS is done for iMX93
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-wdt-v1-2-8955a9e05ba0@nxp.com>
References: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
In-Reply-To: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ye Li <ye.li@nxp.com>, Alice Guo <alice.guo@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720737668; l=817;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Lssf7zW63QxcIcE0BxEXszE3aYs3nARLbW8mNNf7Spc=;
 b=OgoZeow2cXmOIVvyROxk+71KDU1NNU2AEoHL1Pa7qk1oJUVGLN5PPKuB24uTeFju273645AIj
 wOO/Fccy2zjBK4tNk/rtvdjJv0CdgkXrrTWZ1k8LEvM2jy7m7YZ0FW5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 686d7138-4cff-44db-6d9b-08dca1fa940f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlFNSFNrZUNLQUc4dzRkMzZSQUFKMS91YkdXNk82YStZSm9jeSsyVEU5VHBS?=
 =?utf-8?B?bVRNT09wUlVHeTZhVXY0SFdFdVNlL2t3a2NrdndqUDFvNFE1UVh4VC9DRUx2?=
 =?utf-8?B?YkJmWUlVdnpLVXNRU3FPbjFPMGpvK20wVUJvOGpVOFQ4ZmxaMnY2VXRQemxj?=
 =?utf-8?B?ZkJGNWpyNG1YYU9OTmdrTFcycExEVmZTbU8zMnBOd3dEZ0ZuSTZFSjgvNnRl?=
 =?utf-8?B?MEl1VmFZREdScmpkR0tWZG5jdi84UUdwSWM1TUM4WUpMd1FQdGdPbjRuRlFK?=
 =?utf-8?B?bnhLZ2VkREFCdno5S052TWU3OWhscnFPN3VJMS8wZ1pRQmIzMXpKUWJEdE10?=
 =?utf-8?B?cGk0OHZHaHlpOFl5R1BPV2pwZWNNQmg3eVhqa1BPQlhkV0VBTkxLQjU1UEdC?=
 =?utf-8?B?bWM3NzltOUxpTFBESHJnZ2NCOEJrMFNiZDFvM2ZDOHZMK0F5OWJCY0J2cGpw?=
 =?utf-8?B?cWh1OVJ2aXU2NFo3VVN3TDNLa2xUMmRCVGt6a0Z1b2YzSGlIQmt5aVNVMEFn?=
 =?utf-8?B?M3hDTUFzQUt3Tm82UzdHdzh0emI0QW5lYW8ybUNjaDJ6ZHAwRUw3Nk9VZ0Vj?=
 =?utf-8?B?YkplRzlZUnJCODZRK1c0bVJkRWVqMVozVnpnQ2JuZ0JtVjVNWWt6Q0VweTM4?=
 =?utf-8?B?RXdIMFR6ZE1qa3FRUGE5bTV0QmxKUU0zSktMRUNlMmFLUzdERmxmVGZEdXNU?=
 =?utf-8?B?ZSt2R0dqeUdRUXo1UzhHMHFtU2h1aU5iV2NaWjllUHVLMzEwazNuZUZVaFdG?=
 =?utf-8?B?OW1sZERHTDh1NklqVWlESVRPS2xkSkd2Q0pGcGlBWGR4bCtiVjVPV1U4RDdC?=
 =?utf-8?B?dVhqVVdFSGxGUUVUZUNCcllpVzVqQkVzWCs5aWVneHR0OWZ4M0QvMmVFdDBN?=
 =?utf-8?B?ck02THY1UVlpQ2F4dTYrOVlseWd0WXNzamQyWjZFNFd6YjA5dkU5VHZ0Nld5?=
 =?utf-8?B?NlV5U0RJQWtzNEFHS3ZPZ3Z5OWtSZTcwV2tpT0dGNjNZdkpWNytXOGVyOHNH?=
 =?utf-8?B?a0RMbHVCMUh1aFAvdE1tR0c4WW5yZGFRSFNxWk93bG9oL2gwbUY2ekRJMDI4?=
 =?utf-8?B?d091RVB0VVZ1L3E2cjZ6aTFpUC8vaXFWeFFGUHNUcnVnMXVydGEyd2tpWS82?=
 =?utf-8?B?WGRkQVJ4b1Z0YkJlYnlhV3BnNldSQmEzVmJvS0hLWk1pc2gzMGl1ZmlGdjY2?=
 =?utf-8?B?bTdLRmk4OERnS25IbjJTVTg3cERXcXExYjhremVkQjc1Nk02TVpjVllPMU41?=
 =?utf-8?B?UVBjdFNSMndpOHRidkwvOHdmdnNIMENXUXZQWDdQbFRWN3kxYzhlNWdlbTg5?=
 =?utf-8?B?cDU0T3BDQzV6TmZZTldCN2tBY3lTbmxXR0E5UDh2QjdUMG9pcWZqM3NkRWRE?=
 =?utf-8?B?Qythd2Z5dWlaLzVOalo1K3hpaVVtWTRNQ0o3SnpaNm84VmdIZzNJSVIyTkRu?=
 =?utf-8?B?YnMraHhxdUpQQ0JESXdRckYxdk4xNENEVlhKQTFVWkpzZVZDeGRNczU1WGhi?=
 =?utf-8?B?ZDlpV0RqM1h5T2dsbXlRVktSODhLYXMrODluaDJFZDRIQUdhRDY4cnprWVk1?=
 =?utf-8?B?S1IwM2x5NTVyRkE4OFV5TURHa0VZODlEeFNxbHhpZ1R6TVFsMnJxVGdaRUZR?=
 =?utf-8?B?VGRNcXV4NTEwemRwczBXQm92Q2FqQ05QT091bGJFdjJ6WVZHTitaa1o2Z085?=
 =?utf-8?B?Ukw5YUR5dGM2aTlDeHMzeVdNVVNQRkRuM01UTlVySGh2cTBWZ0FXYkpGRVE3?=
 =?utf-8?B?OTdQZUc0Sit1YXEwbHFTOGpFWXZpQ1RuQ2lvOGx4TCtwcThIRmJzMnZUblBh?=
 =?utf-8?B?WUh0Ui9jYm5kc2tDN2RTb3hVdXFUZWk1MUFrQXRhRVRMQ1E2T0ZtQ2VUTnFR?=
 =?utf-8?B?Q29DRUx3KzRDaTdnMTd4TVNCQW8vb3pEcEgvMDNISjNxREE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFh4WGVldGR5bHRSdHAvd0NHS2kyeXExWjRsQzZlVldUYS9ET0FydGVWYnFl?=
 =?utf-8?B?NE9sS1BEUFpMb0JnWndQTi9zTUtQYVdQNkorNnNoQWZERU5reUtoaXNCT1pq?=
 =?utf-8?B?RUx4alRTSjdhbElzSTFnUlBEODFuYXhLekNaSEc1QmxrcjNER1A4aU00bFA4?=
 =?utf-8?B?ZzY0a0F4TEg5czZxVjVNM1hZZGs4Sll2dHZyN2daNlBxQUJxYzVpTndvTFhI?=
 =?utf-8?B?ZWhRSEhGTnpXV2FTQVlORUp4c0U2M2l5aWNhNTdSNmZxblczV0k4dnVRY0o4?=
 =?utf-8?B?Sm1TSm5zQktCU3YxUFVHMUw3TlNUc0FJZktNRzFqeTlPUndMb3M5Wit1dFp6?=
 =?utf-8?B?aHE5R0F3dmNwVzBxeHRLbkZxeXl1SlNYb0t0dnZjMmpDbHA3R0xkSVZnVE1R?=
 =?utf-8?B?VlQyRm9tYmdVWUc5MXdzajhjQnMwZXBCL2VKVmFqZGhZQW1yZVhhYklGNDdF?=
 =?utf-8?B?ZDBuanVDNE5oMjVyNjZ5RVA0bU5ScUxZL2JpMGhLRWxhWjd1Rm1xRlJkUG1y?=
 =?utf-8?B?c1c0aU9sWkhNUDdINWlCdWkzb1U2ajhqNTRKa0JtQUw0YTBPZzR0SGxSVEdk?=
 =?utf-8?B?SjJYUTdONWtMUHBKOGFmUzB1SDNNTmpVbVpoVmZ2VjljS2psZEc1QVNKTUlV?=
 =?utf-8?B?aWZxQU9pYTB4NUVkdHp4a3dwaWFRODMrbXJVT3N3YUtKNlVseCtxZDRPd29L?=
 =?utf-8?B?WkVRdU9UclQyc0tKV1hibUFMVGRjci9rWENZZURaamRnR2g4YkpqWURTaTJS?=
 =?utf-8?B?M0dmUHVhNUVEc08yWmVMamFPQjZmQU1uc0s1QXlNUHFvUzI0dmdTUmlWZ0Zv?=
 =?utf-8?B?TzlqOThtZ1F4MEYvbStlUXc5czg0VUphajdRYkRIbTR5L2RJT0FtWm4zcVM5?=
 =?utf-8?B?dERsQnJERkp2Nk41aVZ6eUJJbytWY3hMRUx0Nmd0aHZDOU9hS0Q2V1BNZ3p6?=
 =?utf-8?B?Y0IyaXdsblNtc0laa01vMTRzZndCcUp2MGZvanJEVlpNL29QenlUc3lXMkhV?=
 =?utf-8?B?TFptYlhwTUhSKytzbzBuNkYxbmtSUSs5cDBoWjRlREwvQTZnZEtBUnJjQVht?=
 =?utf-8?B?WUJvaTJXUzlKSVF0Vy9ya0k4NW5rYk1DVkRCMDdxNkkwK0lLMjg3Mkd1N3hT?=
 =?utf-8?B?eHdaQkFGMzk4WkpjSDBqanJpSjNCS3JIdDJQTGV3RVM3b3JUcm1uTHljUWI1?=
 =?utf-8?B?VjYvUFlXaWFFMUVOdE9XQWs0TFpZRW5QQ1d3Q1NjRjBrVlcwYTd3OVkzdHhB?=
 =?utf-8?B?VlVMUHhHa29reUhtNitmTTh1clFiS1g3bzZISzlGUDNNMERzbjRoUHBKR2k3?=
 =?utf-8?B?eHRVcDdlUnJ3aCs3Ynd0VCtpZE1wMC9OdU0wazUyYjNtamNPREhpTlhMTm9x?=
 =?utf-8?B?STZmR0tvNnhYYS9BN1ZJUTNSU1B1UFZET3YrRjRqUGsxcUxMampSd0ZrNkJV?=
 =?utf-8?B?d3JiR3d0aUd2WEpJQStXNXRtRGN1aUg3dzJ6eGhuMFd0VTZydmVPLzhLajRC?=
 =?utf-8?B?V01JR1dTMDF4MlBZRkMyTjZvYTN4azNoYWlsQklOZjdSWElWM0ZyVG41UjQ2?=
 =?utf-8?B?T1pVVlZnRWdZb1pRY0NFZzRheStYcGR1RVl6Z2RqOTEwQm1MUVFoOGFCZVIr?=
 =?utf-8?B?OHNlWVhRbXBlMGxCVGxBK05JR0dqNVNHbmpOWk5PQWc1OU5yUlRaZ3ZLa1NS?=
 =?utf-8?B?NUYya2d1eXRvR0pvSlhETXJBMjNEbmdNclNnaGh5OVpzN204Ym5HdE55L1Zl?=
 =?utf-8?B?UjY5bVQyaHBmOGZac2ZUOFdXcGhldkdMY3d0MnJmL1c3aEp1ckFNZVFjQ0JN?=
 =?utf-8?B?QlQxVS91eEJzRlhRdU5IVjk3Z2dKUEZXQjJuQWg2Ulo4MW1kQWFsODNDUzVm?=
 =?utf-8?B?UEtsRXA1N2Q4MmVzNlpwNjRFallDME9XUTA5UWFnU3lnMTlwS0ZTcndwS1R3?=
 =?utf-8?B?UWc5bXVuZENuNXRyQ3RHcVZ2S0VnVnNlVGNwUEpwbUxtSkxVRmJZU1NZVE9h?=
 =?utf-8?B?MGJicG1rcnBycHJwOWZyNGs2UUtxKzZ5bG5tNGlYZEVyUnFwVVJZTlRoRkty?=
 =?utf-8?B?c0krSHN0bzVNRGthMDNqQ1dKUnptcmVGcjY1RUJTL1VlSG1LZkdXTGF0ZTJq?=
 =?utf-8?Q?U5p7AYmzZDEAHdkj+pm+N6ten?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686d7138-4cff-44db-6d9b-08dca1fa940f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:41:17.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv4JxTneyWkO18Ex55yH4p210/CJlxbrjOThksq4TGgFfrq4kYJWjKhQQp6Jan10yt1buezzNSXuOzIsMAHgUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

From: Alice Guo <alice.guo@nxp.com>

i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So set
post_rcs_wait to false for "fsl,imx93-wdt".

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 904b9f1873856..3a75a6f98f8f0 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -405,7 +405,6 @@ static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
 static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 	.prescaler_enable = true,
 	.wdog_clock_rate = 125,
-	.post_rcs_wait = true,
 };
 
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {

-- 
2.34.1


