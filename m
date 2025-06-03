Return-Path: <linux-watchdog+bounces-3605-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DAACBF0B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 06:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90F7167201
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 04:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90354155C82;
	Tue,  3 Jun 2025 04:03:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2407081F;
	Tue,  3 Jun 2025 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923433; cv=fail; b=hJO59CBuzhuKLAiJclOOIF8XFT04tAydR6A5mT16qqbTsTssvw5MaaZuEjZWOgGCjuc4WgsPgI4eE1fhGNbDVA4Hwc0tb2jPT+zTpMISqWf4arRijhnZQkKUvWBfOHgzB5s4DY5dWV7H5klKahrTc810jv33hzT+TIbSRWNLuHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923433; c=relaxed/simple;
	bh=ufWU9E4YHMGkFsSqmf+Fcdalv/j57vsu3oW4kjcyqfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U2CbuWbZ7HtiUm6TAUT2hZZNu9oz/HRQLD7nc7U0wiLlZqovHexutg5f4u7D8EZE8W48CrtNY11FhaQwv1lzje7bLBg4g4twbtssWnYxLsyrZ82n+9StVLJPvUQ0zzfgfuxY3qKqHIcRlpfXi2MAscHAUHGVxeQEXgucx5k8vfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5533jDgU014055;
	Mon, 2 Jun 2025 21:03:16 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrg1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 21:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOr1XdzqxsB00bBJUrP2I9c9izwanbv/TrKwKir4GGSaqJ2/ddVVrb14Sh02dEFCr5cHcm13IlcAweMvRv+b1YUpXNto6Fguvl51z/aXAKIK9yMP96iKKhhNeP8ipM1wQPBqz7wV153KcT6Tio7261haV5gNWDZP46GYBf8TKNMd6W0Pv/mpryOHEOQt0Cb4LTsoD58JR+Rfg1aCzK34eUikPwwHi1GxVTYXUAaXJQ5cUYFvcW4SWJCU9lxwm4dk7aIPUyXEVpuMFUtcmawBs3eLc1HI14mW0jXmPl1xC/WbImafSf2FtePyWR+C/7EcFtbOBsXI5h02gfr0+q3IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+y6asNJoZ51aSsZv03Qxh/ehHWJL4DAO1Z+PK4IVps=;
 b=bSkAo30vw0uV6oW0o2HyUditR+N0ewMuOxFfqbVckxlcjTGF3EklQySXUbsVcSYB3h5c8N8yFN6roOgVyJh0NR3GueF7/n1TwRDBo0ut02BO1NHDJfeNpPRI95DWn+f4yfM17rCLtfsYeSn4Azxzfi0nFW78vIizXIaXcwAB5Ni6b6tmwOattLHPX/jJFWWBANbY/Rdweo/GxXwr/agSBdZUe86c68jwRS5Vv5kZ4HFu83Md8ax86yfDWeKQ6zJlVnTmWKeqMotF3Ydbs4y/Qw8xb6rn6EINsPST2JfWDXPl9FYCOcLTi9oZDWAwcFPTEysaLMj3/qxXiNEghylHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 04:03:14 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 04:03:14 +0000
From: Meng Li <Meng.Li@windriver.com>
To: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
        shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property back into watchdog node
Date: Tue,  3 Jun 2025 12:02:30 +0800
Message-Id: <20250603040230.2012772-3-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603040230.2012772-1-Meng.Li@windriver.com>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0249.jpnprd01.prod.outlook.com
 (2603:1096:604:24b::18) To CH3PR11MB8773.namprd11.prod.outlook.com
 (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c82f8de-eaa8-4a02-8add-08dda2538fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TOMEGyDnoBLi/DSOagBjMZDbz9Br7xE1NytK38lyWTwpp5tFHyozSx/qBYol?=
 =?us-ascii?Q?JgdHImodX6rHZ6leztq8aO8EuI+jz5X7GLLUa+CaHZHPRIapqJjcjfrMG3dN?=
 =?us-ascii?Q?acqYDePb75WKMtXSZJHeR5jdPQrT3OVkJ2GQegKUlByzNz5daCA+TZVVQWHB?=
 =?us-ascii?Q?+mEBZo1Ri1noJcxaaOUXcH90Z/LXFVYl7wZcnGGyiG+08rYCIG3g9ebzzb4S?=
 =?us-ascii?Q?Dbb4jr4/4Eq8y9CF5iSW6b3bdRNusdOmiQKRbylWcV1C/6SoCS7vKmsntPN9?=
 =?us-ascii?Q?7Ups4KFSV5iADS9gXQOOxXHpWSrU9/tBCaaoBFK1HmZRDqAEJoEOZ3ki9sWt?=
 =?us-ascii?Q?lfpHTMM9Z+chkpdj9GTpUFGNTNZajSKZ88Y8hjg1tqDo5ac5B+wfKQh5tGhX?=
 =?us-ascii?Q?+h5+Y6h68lWwofNEAX4wDEteJ5geajfdNyv1TSnQkV6Is3xEy1VaoNrLYh16?=
 =?us-ascii?Q?rwlpLVoB19YB+QuHWIWHU6WxavbqA0X2a6twesPwemX8cenCPd2b5HDKGvJt?=
 =?us-ascii?Q?5V4j9vi87hA6UHAvjMNwJ+DWk6sO8vkjU+Q6noWKv3ClHiBO1tdWB7VChy0/?=
 =?us-ascii?Q?57RREa88++CungNUomy3saldQ4hz/uz8vsrTYwBhvgKMl50/+9IerOAIAk67?=
 =?us-ascii?Q?7f9rXFDBjHCkehklwIuCt7UQLvfwOvKxvdVPyr1a+90mUh6W+TuPHEjAjB+7?=
 =?us-ascii?Q?PutUSEWHcXJPaRFeILdWuhqtlKfjQU8LuXz2JBXHuiGXfFeLDOJALAKP+ytv?=
 =?us-ascii?Q?x+m2J4gfFzmQ0ryGOFv1AUJlFVyqkckcDJI9RcJqsIGssaYpp1Unm7An6zap?=
 =?us-ascii?Q?1sU2dFe7f1zB8gmcxo240TfNU5IF7Lu359oxGyhwCa+8C4rmVyI9lr2Bbquc?=
 =?us-ascii?Q?CUKksKHiAGuBK5QgdwxotRK/GYEA+7eHuhGMDTpLf2f7ckm7pEXdltlsy77z?=
 =?us-ascii?Q?AyHF0hwy19oLfJfaKJ0IA1w0QalHWwHX8C9piqhnMQzgosM3l/7XGa4EtzzW?=
 =?us-ascii?Q?WZfTB6PwDu+BLffLyJvvfTqsohitmcsFqZNeBQWt7rHthqVkId8vcy1Eu27v?=
 =?us-ascii?Q?5HykTUxAuz/KExc+6CVb110w6lGAJJlVThwKIaC7GULKlQzaoflBMuB4qaQD?=
 =?us-ascii?Q?DzZUkNabi8jldb/kZIWV88LN/XifeUcA4uYTg7gynfEo1pMe94kkp5bC5enS?=
 =?us-ascii?Q?FbLlhkDCLeoy3cmrmIfSH0qwxt4bBjlVDZv+mdwTmxe8qIg4v+jeYBwqd3np?=
 =?us-ascii?Q?L6pNxaT4TatXk1hiAFub50LDHUL/sNcPcn7Z3PYSHRF90r5bjTJ5eIHJpT70?=
 =?us-ascii?Q?kNF70hlEwyghmoSAGDUdg/2OFELicnn/vkoM4UsAis4ft7X7U2xCvXagEMOM?=
 =?us-ascii?Q?IxI8s4v+YKDz+1ZN0vzNDMI4MM4d4gXOBIvc9APHepBtZTQ5mL6fnzZxXIgM?=
 =?us-ascii?Q?TQZ93+hKbHeDZRpsKDl0VKjAstKnQBkl1BiV2hDphA3tVHCvbCKRpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XRuBhfF2vhvNv2VurvRHE/fRcCLu/bnnazicK6qHx7no1oagbn6xTQFvJxcH?=
 =?us-ascii?Q?nwSbFp9KsjQDkOkFZw7UiTRWb2zTsVttWSrG1RmaFlA4BhcDOEQDDZLBWKUc?=
 =?us-ascii?Q?V4ogl/rxTDrgJyJlzP4nJgdGv+N6tCc0G0lAlKjgjJ2ymlKlSRCT8eJ2g9r8?=
 =?us-ascii?Q?A5DEpEzQy9AUufuho0nLNGUgKmEUd6idvixIbu0tbrSxn2Mxwjk+CXUI5F/o?=
 =?us-ascii?Q?Rmb0gRxc438rE12vpne5ZGpBrVg4SCK8q8pV6J3xTtmnHlbmQJLbFbz7VksI?=
 =?us-ascii?Q?Dc1iyxoLWvidQS6j1xZy1VOpdKCs0egAZyh+DzqMM7GIOR0sP5Tst10Wpd5m?=
 =?us-ascii?Q?bjfLTnNrJ1POVenJ0T5FuH8buziGQTtAOht6N8BAV+udJs54Kxgd0hVRITv4?=
 =?us-ascii?Q?mHkH+EFNuOx8kLCbkWwPhPQb41e9f5mngqilYibLW5qD8r4MYVBaoTI8UkPm?=
 =?us-ascii?Q?Hz0IhgxOnzHylu1/d9GDddg6SY1pJByXJ+g5ssvmiGSTZVetRJeuLHKuaRRi?=
 =?us-ascii?Q?HyllRJc5ibRVl2vZUTGeBx/+rS26Z1qf8VnqV8G1mqBadWw8wWFd/7uYp6Vt?=
 =?us-ascii?Q?xPPxwYXna86Pxf6L3K2UAfA3ckpFjgRO+goTdoHdrBq2M2gE/wx6W05+6fZs?=
 =?us-ascii?Q?4ZtwmROSivhhBJLRaLcMuPKl+Hf8SgWfwbBFQ9IrH1ncQFAwjEJKo5NgQ/14?=
 =?us-ascii?Q?XIJrhYT3Mvw+x/X+v2yUmTokR07nqqugQRyTBSrtZ/tcomzq4XUj2ez+8bqK?=
 =?us-ascii?Q?JASljOTanrxM8DiWQVh73fryWqqJLXHZJRZIgdbSHE+Rrb8hcEUZqeZMTjgt?=
 =?us-ascii?Q?Z48LTSgQnECx8uIZ5l4MuL4Ue/4VwkyUoXzY8u6mzRGeDwT/UgG4nf/QTs3l?=
 =?us-ascii?Q?YoS1CJtndQ0h2jKAbP1eb9K6RBA7aVSfnfv3WgFKWBZ+rEwWhosC7T2hYm98?=
 =?us-ascii?Q?Sz5r4odsVRo5vYAcrMiiGW0CCvpfEo1cdbqj+8mUZMdA1f22xTlnMuZvULhx?=
 =?us-ascii?Q?aaGA4Iaj1Sr2H1SWlXnzcTm8SYjlFU74BvnGyUIQ6jvAcLvlfZWJtD2/Szbf?=
 =?us-ascii?Q?2D/sRNLtckAs0F3jNHEZpBtqoNNVDoxkoyrXOm/Yw5KM1KkFMCfKj8koEmTF?=
 =?us-ascii?Q?hC5+38yKgpABv3/9hDR2fDvl+d8XtkkcMwjM738oRF+aq85rR5t0wyuWQMzc?=
 =?us-ascii?Q?a43JX57zQrN8Cu8RRXxYsyONQENezpNMdDPNFtyCiVBjyKpKJOE/7MctmFLA?=
 =?us-ascii?Q?xXTXFgQYjcPY7V13th8HwG0r6q+M7H0tHImCw6kIojiiXvmTE8pMpWAcKXUu?=
 =?us-ascii?Q?WcrEyou69tGfYmi+SnoXcBNurxteC511mfjjoUJwIPaUG4UolGy0NET+ybW9?=
 =?us-ascii?Q?IMnPfu3OBLjvjALwilM5B+duiFR4UtMIaw0+9yS7R7GKyy/5WNWg2Bio644L?=
 =?us-ascii?Q?3uQPkGdP0PJYBJrfIKVes5CS4aepcsYj23Gx5W6Ps7GjvbX6vJbHVCVBAy00?=
 =?us-ascii?Q?UFiz5HehIRa/Vg/AW8wJwANZuWuB9ISVkZeSDSjGrB30XzDsxxZvTNshPN/j?=
 =?us-ascii?Q?g/h0iztF9P7QTPY96FPn5zbb17KG5SLCr0jn4ZRw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c82f8de-eaa8-4a02-8add-08dda2538fe1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:03:14.0020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuvEJ6aJF7yUpHlCmxlL/sz0GHfLcGxEsEYDOxDgcFZoqZM4JR3RCtDsam7tS2SZe8yzLe/2EKxq9s2I9X1BBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzMyBTYWx0ZWRfXxvBAMJqfy2A8 zUguTZ7PFjaDQcG1JJizp/8NRhCMypq4HBF91qrI2Fb2RsM4n4mq3ohqWxlcFfMxJfbMmemeM1i 0z6AdT/+v2aSSc8xvgeYfcG6oTg59WGEJ+sk3gbX75KcILwf2wkPjnVUy5UGS8Q4mFdKDObMnEx
 kS5gp1RBJkfaE6GiUL5MwMhO4ZVdXp8vCjDQUI83cQC3Qlx+CGiPr/KLCKarepgtwzwfke9PKfj XiQCEv5CxIk58U7xUtVw7gj8c866jrQeYd2Bx/l0xsVqKXLPOZ24Lxd06/sJxb38mcI+PjJKui8 qNDx5q7FN5yWiD0YWMAoEMYRpKT1b5HuPvnx+bU1PXru6pq6HAtJXkMLkzDAGF71KPlV14eDaa8
 m1PeqHjV3fSbpxMze3un0prlGmbF4BYl/UwdSTeRAMoJf8VGkgd37sHl75CyOH7ZKeqTo40r
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683e7404 cx=c_pps a=EAmgx7X/BcpSCz1KBN8fIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=xifoZ1arTWCMt0TFFioA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BZAGeRuqc7P_KiX3tkWvHgP91qxNLJxN
X-Proofpoint-ORIG-GUID: BZAGeRuqc7P_KiX3tkWvHgP91qxNLJxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=873 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030033

When verifying watchdog feature on NXP ls1046ardb board,
it doesn't work. Because in commit 7c8ffc5555cb("arm64: dts: layerscape:
remove big-endian for mmc nodes"), it intented to remove the big-endian
from mmc node, but the big-endian of watchdog node is also removed by
accident. So, add watchdog big-endian property back.
In addition, fsl,ls1046a-wdt allows big-endian property, so add it into
compatible property.

Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b4400..983b2f0e8797 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
 		};
 
 		wdog0: watchdog@2ad0000 {
-			compatible = "fsl,imx21-wdt";
+			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
+			big-endian;
 		};
 
 		edma0: dma-controller@2c00000 {
-- 
2.34.1


