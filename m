Return-Path: <linux-watchdog+bounces-3612-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BBACD6A6
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 05:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5FE188AF8B
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 03:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FA7238C3A;
	Wed,  4 Jun 2025 03:43:43 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC861F30A4;
	Wed,  4 Jun 2025 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008623; cv=fail; b=VpF701neVw+Evw6dbYmsDdtIGdKDzGzv7cpf49aF94V+smNdRDXVNHZZn3Lgr/bmEDfEdfyb8+EjJC/fwImg21DR+C66FrSBaBs4o7g8W8db3qbEZFZACpKnAEeokV5Hv/vGLQCHjTP41N23mnF7Ezp1bFXo3M4rIjJGJ1v7O/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008623; c=relaxed/simple;
	bh=yo9LSrT5/cjj2c8tQEuKrvmfDX2ANjxD4QeS78EYvyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UzVqM12y+jqFe9syIyjoyZcPfZqOh4VU88KB/+rqteF0rMST7hHR0EVpINabSR6wlfWdiU0YTZslJn04wPtGNG9bGS/Zeg1wayUEB3DowMEk1BR9eaPNI9nr6zp72bFzszp0vxLVyu3nhPObim6ba+4+ZVIXLIES5bu7EOnxk7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5541lm7A023403;
	Tue, 3 Jun 2025 20:43:10 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsxga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 20:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFNnp8X0dgjLppqePf80pfzwGl9BRwKLMD4ZnwCBv2DXmZpFUBWEWrxAw5Pi9msqcj0GDf8EG+6e1i1N6xQw2GLWS+dX6ybmYdwl8wO8vY6GbBskVoIj6n23jFwOHSmRl/loG3SDVmMzTXWtS8ZBOs5N25vDsEKG2palnoSywXxs5pN7mERQexFoFNTrN4yb41nphdcYXDxwwoU3BANGLtn2zNu8aHqdhTwMgoYJbzjprP1skRmw9AnAlxL6E6QHOW0Z3VgkF4oxtk6YeJvR5MqZekBXWaD/YW8dRkaZleQjnb0RF528X46AesuP6WzpmgGxreT6FE+58/b70+oMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+K88mujTuRk0kpl9nRjsV/LmAdEhX/KbInc1qKoBBw=;
 b=HP3J/DM44e4s5QZ9ZEXNjhPPh3ITIaKun1mXHjSBxBcQG0HHgzaQfUqXkirfs95FwcBZbPQJiG72ed0tPwY6gRPllBEzTyYoNU7jMCiWBhje5MDH3yco6HMbeSAbUmqK2jNMDmPVRkFnPU1jBlumhAbfVF17Xs3rsV2RFRTC1Fr+S/r3X5Df85vA/uglyyqovs5GewJ+JD8DFXJOcHyV5nsw5Z6MYPAJ/DJERnnWPC++ZeFkvQ7a8O9fPXwxzxQLjgUboEmBrc5rm0cnJNVELbFlGmEhJ7dlrQnkervXXk6IE/sB/n2yl5tBfqO75a0fRJVI9+gQkzFwz7xQEYQLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 03:43:07 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 03:43:07 +0000
From: Meng Li <Meng.Li@windriver.com>
To: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
        shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog feature
Date: Wed,  4 Jun 2025 11:42:44 +0800
Message-Id: <20250604034246.3234837-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0033.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::20)
 To CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: eca025d9-d866-49be-7ddc-08dda319eaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gM6zsrDfbRfrxGpsBglKVEDIfFA2ZnMSbvGaSnXsbVcCyD/vap/7mw5oQNBJ?=
 =?us-ascii?Q?dF6sDwz9DsCEiYic6A7Hnyd6H/td/aCpPFK9psZ74EYDLcNZ66ZJl79FkzaY?=
 =?us-ascii?Q?TqIfzKePBDo8PI5RRBA6BShGNZL09RRcbOzMWK5sOJfeQPavV/+mrQlr70ba?=
 =?us-ascii?Q?x21+4WJCylM2hocedAvLaSxPEAhoC0LvF8mveZ4idUvpFlLZjN941pAPE4ab?=
 =?us-ascii?Q?Zzlq4mOvLp38o2NG4rfDvqAB0G6lzWmS7Ht7ZdhvF6fwcMqeFyyqnRIQZKpf?=
 =?us-ascii?Q?LRmjKbfAaNRbbSq99cScRDoQ2JJcC3lDaPyQsqDHIdsOqUaDlOUqdsUt2/Zv?=
 =?us-ascii?Q?EqK7WEaxgABt8vj0a8ixmnothO+DoVa4eKrZsgkMriP7+zI9QlPSQu6a4Y0r?=
 =?us-ascii?Q?CYUZDCUcxm8kZGTUO4pyjjWKoMm04Q9G4GcOgJaFr+RSGDhAOiBrak5HGDcT?=
 =?us-ascii?Q?dAx/nmXjoUMR0W3kygEB+w+3X7gE5H/QTbwAf82VUf+64D+yKMLftqOe7npn?=
 =?us-ascii?Q?pLE4fXH5LZbRXLLjGCERZJS2ch76VSCsIxyVtwoRZcYUgOaHnEayfVn3iQqk?=
 =?us-ascii?Q?EyzAZlFIocT6mtvqMAzIEKCJpkJUzOsiIvcDPV/FgyruhtNisKx3O68eSzCR?=
 =?us-ascii?Q?RnmnkFnjRaz3xRNbTdYoFYbD5eDIHJlziyx3Uf+oxDIhnVCwZC/21zDMTjJi?=
 =?us-ascii?Q?LGSvK4TlymMQssBPRB4UE9NzDM3wC9ILNrY8wxL2q5AmD5tKMG3x5ZZ9iBlc?=
 =?us-ascii?Q?38iqv3/0hAbKdl3fjGuONy8RqPrf3jvsNKHL42ipeIWQncZMm+lDX6v+XW7G?=
 =?us-ascii?Q?oi68VB7zRmBM02r3gNy6BXUGts+tG0KX1XFeNTBs8l3Ga3Ecz4ZraQluEhzT?=
 =?us-ascii?Q?NvJm6SOpQniKtZWn/PUchYd34iZzbTKRSswDENayerePCd9umXhqDvtGFjGG?=
 =?us-ascii?Q?qxF651L2w8p6BWIA/y89okm+SzFsQ20OUTomI3cCiidB8Fyr1MqBaYE2hfkJ?=
 =?us-ascii?Q?mLkOaId+BZ6z1F1CJ+4/uEEPcNxN8bQT7mBuOq3JlY+Ihvy4zlbXq9ebs4bt?=
 =?us-ascii?Q?vrVPGfcK/kJDiyYi3H79YkY+Qs6dgkZpVgyvFo3bwskjmtUnqE0rRH0Bo3MH?=
 =?us-ascii?Q?kPoIdUH574UTKYV0bAfkIzSVpnSpKgtXUqvmzfKXHaeQudoglz7ouBAAFER8?=
 =?us-ascii?Q?61wp17umI2vnWG1Yu6I8Ds0QiTSc8YlYwjmMS3OW4Ltv/oq5s7wKPk+CzQFP?=
 =?us-ascii?Q?UaYuVNmMzH0m02SN/oeFTN3CDDSe+qH3+c9b5rl4uIR0IodKe2FjSQPq9vCW?=
 =?us-ascii?Q?Y66sP9PYc5CVde0THhPTyeeZc7702TgQ8dGXIbRZwNDZAed/vM0OHCMBAMjJ?=
 =?us-ascii?Q?joZDyqrHXRIC/mTGuBqQVzp7joMUiRx/Y2NkY3W9k5TwiZA7wxlEgPMbCJMN?=
 =?us-ascii?Q?BTAXca8F5eGH+C7jPXHsdyTb+wvr9+sJrSr7YZATSlNM6hvynak5ohFPRA7z?=
 =?us-ascii?Q?S83nm5IhdlxoWH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zodAL9FJd9RY3t2c+686kOyDAEpBspPrQToOXNt5naeUEuvuU9KFAJ4EcQD9?=
 =?us-ascii?Q?sfhS54Zcr4j1YXAVeqKDJ8ZDA5EGBdYLTDEhfv/P55yXjcsOmwI+XZCm7Vuu?=
 =?us-ascii?Q?p5KrNyzK2fXrvBylfCcj6FI0ZqhABoFKpOXsfKb+8Its1foaKHNvN9QAXszo?=
 =?us-ascii?Q?MGU8wlNw4HHd37/xiLM9omnFIpNpUFCxB0+RLlrm0zrJRUp5dNkEbNxOfoOh?=
 =?us-ascii?Q?PjLSc/0QlvwCgUT6NPSDPXPmHsBkWFx8kvK1fEHNCvetwYEfv1PUl27xmCfd?=
 =?us-ascii?Q?RlJEjvSSUnc1iXj8xQvCRQoWxFkvtZRXG0flHtjg+A5iGWkQ2M+omgFCUvug?=
 =?us-ascii?Q?pDf/dK/66cTzXVx+62KoB2nLFUrbzk6UHLyWIWgfysBCptuxwSu78dx0GSC3?=
 =?us-ascii?Q?4MNDMm4AfSBaGrbfVWwlQyoroKjmwTNHvn7I+2eYXIBI/ghKSFLySLn1uN3X?=
 =?us-ascii?Q?bsPdjtObWCxe6EcBy2gdYGEA9DKbv7plC7TnvrZJOAwdEW/MdgWQk5f6kM/s?=
 =?us-ascii?Q?cQhs6gQRDB+VCkn03V68MMrg32eslAAI7KefVjdCkuaW+ucwiFVl526OivXh?=
 =?us-ascii?Q?pxkFBFJGCYkRQF2N7SEBRKTOBckjxD74pMQbBCHnj6l5hKswRBHdcGPYfi5L?=
 =?us-ascii?Q?EO+iJaAI93ySzRh93S042BbaG2p8zPiZByIRfhQTqfoNeI4kRJehUyCpxS7H?=
 =?us-ascii?Q?SKBrAZVUMZTD7cqbC+Ifc8juHEPiiXvodOgqtnQZTx2ubc2YUUCEgFvp9J20?=
 =?us-ascii?Q?GTtmJ+q1VKtwiRkAQVmWt3EkVR/CrUw0g8uv2tkExVi2SC2U7OK1sd9etkWa?=
 =?us-ascii?Q?6x1ZptcfFROfu5KWtV6+FHiNHi5Nw9P4r5V3z8SGbk60hTPUtLl+lKcJoqjF?=
 =?us-ascii?Q?KibG7YO9IAtGb+bQ1OUym3HFElauhOkruxAJKOWzK7MQF1qBJGk55DMKNn2u?=
 =?us-ascii?Q?WNFFjipK6/6cw5bptyLos//MybnoJgp/W4AcvyNsAZVAhQHFvExshkKuv9ge?=
 =?us-ascii?Q?1RAtTflfU2pW29N2Q5R1Kxnsm4x48wzpTJ2yJFTOTgOGCzDvBnyubR/cG9lw?=
 =?us-ascii?Q?6wOykTykluMuEbXq6fZqzqw3CZgSuJYLrxY76QH89zy+5MgJZGAiqRAv7qZi?=
 =?us-ascii?Q?rg696efUyj7LqG+FnDw6/4uqpHPgrZLp6+PNTkdJlYX2RfXeJHmNd/iZpUc3?=
 =?us-ascii?Q?OG2eJBOjSqILwrS/YQ8Q3LqTlmCuFA3JjEdE/zultNvD7vk/08uHdoOjvQLO?=
 =?us-ascii?Q?O6D1ZpFo+eVNin7wzT8sUYm966klUCF7SC2eiPViMR9M7s6dQ7naJvsoRfiO?=
 =?us-ascii?Q?xDLq0Wze1wRmAjz9ZoY83YH3Cp+Hvi6YML0EXodNhsPswy/s8APjartwxL75?=
 =?us-ascii?Q?voALWUIsgqkmBKtom2mi60AV8G1PKj+waeGJVoIbhAlnO0YRoZfz3NPDB9Kv?=
 =?us-ascii?Q?bxfAKg6oUZzSkTdMcF9qDHl+AkT2fRn84rFEMky2jUFFMFmIsLRSIFQb75XA?=
 =?us-ascii?Q?RXXIdjPcbHYShC9jsmXOxkz+zW4Cq7w4nQ/WYtEDPSi6JRRpn7W5yUfrM5pA?=
 =?us-ascii?Q?foANlts3H9oyk6RQA8CC0wpP6ZjsRFNQY89sTgQq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca025d9-d866-49be-7ddc-08dda319eaf8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 03:43:07.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyFzXZ7UflGIh/fL3x4nV0FibpM5ne7whbMoQt2ahczu6OeHF+P1CrUAMzZREMqLql8EBOghwa45g+yEdkgEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAyOSBTYWx0ZWRfX7yCg4lOlk7CN u8u3Yjd8S5GV6Y2Up+q9lhQrTCn7NAjbnhbbESrebKjfcxRV36oC66wLTIQra0EyqjUGkqURHhJ moX5W+vhwdh9tmowLGoA7tXjeqRa7cu84psGjCx5SCxIHy9wV+HfYYvzd85t3V7RLajnfxiHKUa
 Nd6BqmUNo4W5vEBZopXy1vylWoFu5GVzisrOgbjISFgvpX2yNjJ/d8P/s4AeAd7S5IRjvBJZJb2 X4isGavh9GV4b+lYYovSFRsF5ftyRMLvR5TwpkkRs8HO/Af82n1eLbnbqfaijnSR+VRDYiZhen9 C/sSkL9sbsEt2lbB4o9hXIgB8Ee7evi6INjWw6hUGNxksXjS8Aic9IkmFeJJ0pg48RbP8I1bynY
 dnuCZZl9pJzIbX3QYb1uhN/1yBk63ndHBbzd3Hm5ByqCr2gG51pr7Ak2GogRuxKo+1j+0WBS
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683fc0ce cx=c_pps a=eQYLEs0CjCBI36aHWeHoxw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=QlqWAYDYS6yd2VLhT_cA:9
X-Proofpoint-GUID: wvfy3YZQZDI6lIKYEUXRexjST2ukj-Hd
X-Proofpoint-ORIG-GUID: wvfy3YZQZDI6lIKYEUXRexjST2ukj-Hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=701 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040029

v4:
 - Improve commit log of patch0002

v3:
 - merge patch 0002 into patch 0001
 - improve the commit log of patches

v2:
 - improve the commit log of patch 0001
 - add another 2 patches to fix below warning
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow True

v1:
 - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-wat.patch

Meng Li (2):
  dt-bindings: watchdog: fsl-imx-wdt: add compatible string
    fsl,ls1046a-wdt
  arch: arm64: dts: add big-endian property back into watchdog node

 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1


