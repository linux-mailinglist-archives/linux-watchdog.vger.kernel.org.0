Return-Path: <linux-watchdog+bounces-3593-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66324AC992C
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 06:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7863B9E6C51
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 04:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4B0235070;
	Sat, 31 May 2025 04:03:50 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D126B1411DE;
	Sat, 31 May 2025 04:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748664230; cv=fail; b=c1laiyB3oZVu1xT3gu6JjnODSFhTC17VEWhCmwzoyjTqUDbgKSzutxx9GkFEHweE+0OtEypkbXqywOXtvuOTRj0Jo9ELr+nKQKY+4+JJsRBBNNSxYlWvH8D2v2uDSN29HgtHgzffRIbMdrvr4eFiXtU4pVgU3AVfHx1u9bY60VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748664230; c=relaxed/simple;
	bh=n3NDQGvcW4Sr3pvVHK5HwltiI5F7+hTaMM7HfQWgP6g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iAE9ht9p7FmalFzSelembN0B621ErfxHq67pGJuVGOTzbuwH6HfejHMxGwJ6xPXb+AnNsH+8ne83IqijEZYlGRi9goe6YCQWQ24YEwOYsCyhADznDiFLY9aJHHk1G8Yt0SRGmdZyoWLlxAtU9gJ/aPkWIlKfO18g0NsjyWZwdq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V3wmJd009166;
	Fri, 30 May 2025 21:03:00 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm70qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 21:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5BGL57UPzfrr2W3WdVQth7wN09dwurm0sjJhiIyhKM0l3qbjSG/URfsNy//jxKQtqYJqRg/i+nyg6ATvLUDJ4hPdgbGhEKu31kHej0TIBktcd6hZDpco5z09SmzgX/hdaqf3QMh22dw/9tFcb21BUMznf1fviAuFkoYqThjKhGux+bPcUvSvHI8/xAiyivVpEKCCLdICCV/9n07tc65DoaAaDtJ6IHv82kFpN2Ss0J7HWX1kN27w8vJMOry+VimV36L1nIGN2xN3KGk2NGaiYbSz5mtbZBeH3Kb82xPoKxTwqCeBVUoTHzU4VIq+luamP4EYE9NJZFz+Gm8CoJkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YA/qhqtUXSORRCARfmPN4FgPW0oxKtQ7Lvi7bo7D9I=;
 b=bmgqdDFqwTqvR4hy9IOr8Ei0tne1SQsOz6KE3Ygr9QVippokPH4BaQgeX4LMHL6Ij+lTFp1FvYZKOWEWyEVuzAtfQrfamdb65wliZd5rlqxP2rkH4iZ9IZbEZ5YM6uS9g/7TjAL6ZIUBOMLAieWYimvfsnRHSj9/JFk7PTkdxYvuyz+KBATK4u0QTbg/NKJAcshca4ID5QZA5yU1FiMyPd2ChCpPav9CpOqWlsZBflgE5uYnPgZgj3+ZxfphUxNC9aia2ghzrFrLTTQ3vwRKNKGa3dBf56izPu4IUOV8n986+/4wLCQQ80HqXzaK/RWmKmuctE7s8UwJ/K3lOB3nGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sat, 31 May
 2025 04:02:55 +0000
Received: from DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3]) by DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3%7]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 04:02:53 +0000
From: Meng Li <Meng.Li@windriver.com>
To: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de, wim@linux-watchdog.org,
        linux@roeck-us.net, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v2 PATCH 0/3] create patches for nxp-ls1046a platform watchdog feature
Date: Sat, 31 May 2025 12:02:10 +0800
Message-Id: <20250531040213.2589292-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To DS0PR11MB8763.namprd11.prod.outlook.com
 (2603:10b6:8:1bb::12)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8763:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 6919c1db-9181-4872-e2bc-08dd9ff803c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qCjZ6SK1LWpINy3i+Zzx18mDCEAhNprdqRozEsm93AjjN/myp6GIaKOOHVCJ?=
 =?us-ascii?Q?CQgs54aUPciXRSoKva0aKt3VA7E9gczSR8lojKgwIrK/F4nu4x/RNrNz9dxd?=
 =?us-ascii?Q?cBBDKVHUM+sTAqmUgxDDWpFWU03N+0yj4gclXRD98olAC+VfRHydmfHBagwZ?=
 =?us-ascii?Q?hCIFPTQunzD2B7lije8oHWAF6l7nyFwAmiVQ9cVFO7TJgVBt5sz5LbsPFfsh?=
 =?us-ascii?Q?bEL13CbNrejbPtWPGsxoqFHi8BriJRHbNdFBoNBiys0PrBSN/IwOvm4L1KA7?=
 =?us-ascii?Q?Wv+xRiRMjaTigsW8ARfI+75UHDFYVsd96VdOOUmnuHucn/ITI0O+l73Auakt?=
 =?us-ascii?Q?pz4NUFS6Xk11QB5K9dPB41Qlw5W+XCihG+pb4lJ3HBrTG3FUYSs+YUosHIze?=
 =?us-ascii?Q?GFyONZ+X8ZQwOQDXnu5b2bBkB6coFeThBgFhOxPa1NlGsv/6uON+QRdWy2wi?=
 =?us-ascii?Q?u6aR5kp+WVT4nX8tJw3DrYoUcG9TCh966hwxMALy/4xiViMnQWwu1sZqtbk4?=
 =?us-ascii?Q?oMB4PqLPojLm/BCdkepMt4NeQfCSttJejcL9XcGYECi1wT638+fZUHsyWqvi?=
 =?us-ascii?Q?BMEuRhzhwfskIDIxlNXN7cYxGjz6SC0woMaEx0stVFIwIEZ2KmTWVi5ScRzo?=
 =?us-ascii?Q?dVpkiaoaCWfYFq8zp55gmoriQVgEHVjgmqCZApZVH4EFYTP0kNL7T1qGkgyx?=
 =?us-ascii?Q?EnT4emYsuRpCPlLU82qG0K8HAv5LYoUfMxaPf6I8pu8M6peMPfxNW1v1Ndiu?=
 =?us-ascii?Q?5uky+hRBbNL+KHxbeCQG8mpjoIrTow1LemSqqfJn1iS91xlPhMD3njcY+irp?=
 =?us-ascii?Q?32pqAmK4rwC3f+xeKSFlpA8cPJvmZGhuA8xYqjauaN15n3CEmzE93tvmqOhF?=
 =?us-ascii?Q?cRnCYOefPHJA/t/Qfnt2lWbI9BVTmOnyHqmtDhqOA1iotE8AzuNefK6HJj0R?=
 =?us-ascii?Q?5naqr+hBJjQFi80qq32hddoXkkKXL+HNFF8vF2PjEOvZwRSlG/5XqTwtZ5WI?=
 =?us-ascii?Q?s080NRVuGKcd8uLRZ2/OcHAJo+XcRi/X8GOa29zk6vrYm2SXm3TLvBKuCj0b?=
 =?us-ascii?Q?nHJLe3qnFRWgtOo+Au6OXsK3XmlXt/sdPx6spRPLx+XhSATbUjhkLDlYsoJA?=
 =?us-ascii?Q?dMfTGXH/epYX6YOcn+qlu1E8JnWVzh75Yw5qq9FPWn123LZbQbv96MY/lEt7?=
 =?us-ascii?Q?4uUMwlUhQAaQIChJxtSgWpZUmQV85PWolptseibev8J416Sl4djNUHrAAZSe?=
 =?us-ascii?Q?oJQEc3MwVOjTL48UQhR7Id3fx4SS5B4auAMahDlXJqy7mF7s2/Dbz/ey5dmj?=
 =?us-ascii?Q?jCjURnxcRGrzx79Rk4gZhy3YYHxooJy0NC7dshzISeHY0BYPOu8hToI2ydEI?=
 =?us-ascii?Q?cXZv2SdIvRNCxbwhYjRDb2BejFTuIPStrHudaCxjTFhJ989SJF7s4TRDBYdh?=
 =?us-ascii?Q?P+V9nS1ZE1BaXYJq8i78C8smi/VOH4Pb8/HJaUu5uVtnEiONW7BJLkIOeZ7g?=
 =?us-ascii?Q?juESdtq+ekOu+7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8763.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UICNLCDMVCmpoal9bUe75LurhdJ/45ozsQqDBguywOqV0SIGTilHk18YvSxH?=
 =?us-ascii?Q?RDi39m4/05cOW02zTgtFDwbOMsrwH8c+Wj6GUQbbLWbS07Nfic6B/13qzE1T?=
 =?us-ascii?Q?hJddgd3wqZWqSoixhVM/Z9n3UHNmSPaKdSZ4vyVV0HlNgyhTUfgmj5TzSjf5?=
 =?us-ascii?Q?0bfPtBw9myFHbksDO6+9h5lkaaqWp3UbUMkKJSkKdnqG9hH8sYs7U0msh8Vd?=
 =?us-ascii?Q?z2BO1AFW+RLyAcYd9CM8fwcYjwHWVRJ+9wNq+QPn7ycaHOsDLC4gFQ37aoeN?=
 =?us-ascii?Q?yq+0SjiV8GIsmm9mEIONdpnm0Y5HA16JxkgMrio2Kc9TGUbYSN7E6KLvxnoE?=
 =?us-ascii?Q?a377jmeV3RHyCGdhw704Fp+VVbR0OX5yGoOSs9bcb8J4V4aU6jxE5XHxI4e/?=
 =?us-ascii?Q?Kto9iWyoUW3qawvFX/poqy8aMORX/9MMt7agXuF5Di79JXJaCaoLzrvxdw2O?=
 =?us-ascii?Q?wDjtebBDHycx80ri27dS/9MF9TpxNHAZg3fAcf6gdLPqslfLVtrVgcZ+3w7j?=
 =?us-ascii?Q?DnSkQDttN/t7eck7gUY+JmAMomJhmZpP5PoYm956Bje2cOHBtzP5yPivvWtH?=
 =?us-ascii?Q?N/oss0P7n3O8jjQyneyUqdqpraNlQCdK5e81SE7vylXC1DpfeqqEadx+asNN?=
 =?us-ascii?Q?Y6nUfCqv8nLPxg/pa64tzNjAoZMXtVvkM44bpiKS93accW+p6BR092akR644?=
 =?us-ascii?Q?gPJ+ewCcAyiPS+bXzj7Sqjv6cYRwl5ctpDVQUm5db1RRHYZ1wCySzDY+9fR1?=
 =?us-ascii?Q?rPSaEq/a6vrEPyOU+6u4RjdcsuyVKEvskgD/IDcGvsLF1D8AExbfPNfAJm0J?=
 =?us-ascii?Q?E27H25sMdz8ZdbnNVxaCOMdaFF7QKFctgUh79BoRJziFgK7vBxQ3vAcboQva?=
 =?us-ascii?Q?2jH2t0BKx1u+Tn5IQ2ZlUX+BjVyTAFlDin3Y4f5R+O5M5qL84Ssx95IHhMlV?=
 =?us-ascii?Q?m8Ih93q3ZNFL6gtEiX2K/OstCg+bJZkHuk588/9wjaMNvXwb4scPTgk5mibw?=
 =?us-ascii?Q?sCkARa8VbOLaANRyaH5IACOftPGFcslJRgx0pX0PaoAROhkYyQOXIbGizpaa?=
 =?us-ascii?Q?TofXQsv8BiShFYwhN90Twry3XZVuV7lCIF+jpovfeF1SqjHH9wfWagrTA83U?=
 =?us-ascii?Q?ygVSAB+ay3kiVhTaPLrUtffivKCLkvA4GD/FqBObVR6WMS8b4PCQfUNtjHiF?=
 =?us-ascii?Q?r/l8XAFdgQekiJ7MGsCbwzMvc1sTdv5KbuPk6PFPjenSkURtNn9LtXVciZK4?=
 =?us-ascii?Q?fFQAjk9H20cM6AjXTrhnny/PkGVBpOOthFWInWVuArxh4qe9a1FbBbl3inRl?=
 =?us-ascii?Q?Kqwzzhs2SD/rJovgUYy/JxkCGKwkH53ILb4wVm9MbgFjZk6VTOxCA5/Oxmd5?=
 =?us-ascii?Q?H+X6mJZ+6NIE6oYWOSWtcJmNjCO9ZoBSs+5fifS3HIxKdR10q3STRlD3qsKt?=
 =?us-ascii?Q?CuTzWmEtU5VVEMSlImBBmvuzQMyvLfNQuwUHvt2+anePe4Qj42q9WmfKWYNI?=
 =?us-ascii?Q?1znfFQymQpEFZ6XTEaRWl1t1xwtgVrCtP6YpSdAhJ3saBsT6K4kGpWc4GAha?=
 =?us-ascii?Q?K2gi27zJYyK6EtSx0fXzgA/CVIV79sZvGJpCLSic?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6919c1db-9181-4872-e2bc-08dd9ff803c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8763.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 04:02:53.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSJSt6K5QLHov4THq5rzxb+suAAt6Nj9hBP73TkO+2i45Cma8SQe9ywwKfFV3I+vLPcIJAICGuNB2gGSLTFTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=683a7f74 cx=c_pps a=I/sNV8c+47LP+h3jbQsb/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=HMR1gXRALbDY60pjgc8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDAzMSBTYWx0ZWRfXxY9tkUp/cios 8Wy5aVGLmwR1uvpfPJ0GpnT8ZNoKMUQkHBJ7vrQSHfdNrrHg9pak3AiU0bUh/OPdkQuVdmAODeO MzkgJEwwN+4G5o/+8JbI8JTlIX8MJHpd47I/6ar4LzOW2ceOOCclgeoynIi/KMjt4MB0ZJrYMUj
 /X9hsPP0dNwx2jD27PFjtmoiaN9ohJ/+toAOnyp2UVY3k9pgnAEZz112Nbjp5ktoLh1YTfDWEB8 2hLh1tkDrI2Eq6DCEOzpSUtjqvwPbKD5Oxk2p9OIsFCm2VgwMbec08iW4a/kQgZEHpORNXjcw5I s5XU2P2WEsetWaKiRjSQyluAn1rn5ccoOW4ALAW2WDxoJMjleXDdDNqRwFq7+ume7o8D6KCOawt
 lwh6sHPeVvgLQmxR2UEViLh8L+Yo7hdTYgyzv1mTBfp8kV48IhozFzo2DQrd1HXvQEEULIuF
X-Proofpoint-ORIG-GUID: rU2rfHmIUxLM_pl-RnTiMNSPdNPbMl4G
X-Proofpoint-GUID: rU2rfHmIUxLM_pl-RnTiMNSPdNPbMl4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=771 clxscore=1011
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505310031

v1:
 - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-wat.patch
 
v2:
 - improve the commit log of patch 0001
 - add another 2 patches to fix below warning
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow True


Meng Li (3):
  arch: arm64: dts: add big-endian property back into watchdog node
  arm64: dts: layerscape: add platform special compatible string for
    watchdog
  dt-bindings: watchdog: fsl-imx-wdt: enable 'big-endian' property for
    NXP ls1046a platform

 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1


