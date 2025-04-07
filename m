Return-Path: <linux-watchdog+bounces-3224-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD0A7ECB2
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 21:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB58188CBCC
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D37222587;
	Mon,  7 Apr 2025 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oUPQxX5r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8791FF5F7;
	Mon,  7 Apr 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052417; cv=fail; b=DOwasU7cbHaKnqhnOM3jK3NYLs6kBFgtQ/EVuJ8c3pHsd3p1vJG7lHubJ4ZpdbFBZUnw9gl0Q7olT/lWWDJDw9nk/XVTQqeSyZT2aGDP3cU09qtpbBCYwr0DoUKjb+XKMkXc2xri5mbfLa1cyYz521qvDLScn/m+ukIIVdS61iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052417; c=relaxed/simple;
	bh=xDXB4kTbX6hliwzrZ2qLFIoLPWSM0p2SGZkzyPfqgtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZmfLA6aVgjcvpXmuuEdQpxlvsVRkQSmpq+avMo5n9ym4cBqivifjogOZQFmJqY43iKEzfEfe6ho3zMFnSdledV1XsGxxDPXQFgL/tT2g8spRCmRIdgwN3pSLWSW84Y9676PTbCC0ZY45DEStIX2NH9q4UW9ti2j4LXtyj+k/Pf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oUPQxX5r; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfHF8VDJR37C8scsn6tm6niVtj5m9LIF7bY4aOZzMuT5td29m9+FrA++afIm9V2jyIqaHFQvJk8QFx5vmf0cuC8WhNOO4wdvIFUJoqk9RjwirnqBNn0Y3/h5Dlcxa+SbJ02GJUskrQ7li42iQEabUPeI/YtoOWpijYGZbjz0Lvk6Q7/BtjyqLBXMK3UBVWeJxs8576Hkt9PsAwtDq3rt4GXVZgHsVZspUj1UJDMhna0wdkNCamqakStg4ob7G2lRmqjMdDYQgyENoKXgnXwl8XQW3q1WOSC7kpbH+H5auvBJgKbm5BjGzdIYZP3P4yoTCzKyEgJMUGJc24XI/Dv7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HshgT8gkHC7iFAlw30ladT6rzQopziQTfNJrvahl8s=;
 b=D2UiZd73CsKXGZdJS8GI9m0yt+0TwacbsfcOdf7xPIVcrgtT4/oZGV5pwYYLcL/pfFd5pouuUZycVx+PWK77Fh+EcCaYoRT1rz11HBy6C/iJw25Cju0KDxCFQV0ELhFQw4KAEMKkNkUenBzqDx6aR9gK2J80FI8yCiyltJbGCrcDEijECEBDhvqWLPziCcKidGALjwYrxw1FBCBHBF82R1hN4YcQRyPtprhBvKHEg+iGTsdrfYimTFAyWbrmNo9j9iFT1WwlVn/+uWJVjdPDAPTNlR2EUIgoSAXMddccMKZOwwn8tJnbecSK9K1114j7EthrbrsDnqUzKvecdsaUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HshgT8gkHC7iFAlw30ladT6rzQopziQTfNJrvahl8s=;
 b=oUPQxX5rE86AljKHjcSVLU4T7D2vaFlaYea6mUXKiXX00X9JvhNQJu9vJftIWbCxmm8/r0/MTthIH29eBY/hgH34lDVNF+i3jxMsFHazf81yDX0S74n7M6Ay6Zep1yXLhKawm5YJmvOLqRk5dBcuhdgbi/oGdba71eH8WnpA1ZCEy7ziQkQ71FWYU/2Cafs/gTMwh4ntV62eEIq0qkRGBKdlrStD6YpZ60sMjVV2kBYfDQnG5ExtUYuO2Cw39JuGBGiHoXxFyR3IfccSvWF3PCY8C8qRwfWQq96jTaOBJRtG1JUp+K7Oyro8BcwrfrQsPQj47cRwau2wfvOYlv/Tmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7768.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:00:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:00:10 +0000
Date: Mon, 7 Apr 2025 15:00:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm: add system controller watchdog
 support
Message-ID: <Z/Qgs9bwjIEbESyZ@lizhi-Precision-Tower-5810>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
X-ClientProxiedBy: PH8PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: af5d03db-ad65-495a-e03d-08dd76066b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oL1ApUbLHDyIHco7jUJQ0PTlVet939db0XRo96uJbV97desowRJ2Yq8OOyFB?=
 =?us-ascii?Q?qxrj5bKBvJK5gSVAI4Zx+Jj9/VEoVQPq3m0KVUVdLadr74Kt4Fgud7Yzei31?=
 =?us-ascii?Q?H3qpLa+C8/FMMlE9tRMSa76tEbgTEwTgbTtC1mCYXduF5dqT1jCK7w0Ai7MR?=
 =?us-ascii?Q?0WT4i7EJmJ6MsWcSlLji9+KfFVT+YgxNahGp1MdVah7Xwuunvn+LSPQUHpfC?=
 =?us-ascii?Q?FghoXqqLkZotvU49yZsOdmlMmR8sP4WpEHPy0kdZ6LwllaYyEKqZSGCU+r4A?=
 =?us-ascii?Q?x1jRc7xh/hLAtvoHcP79E09EG/OOfdDWuHqIZgaBywBrvcGbO4M+KIcKRtww?=
 =?us-ascii?Q?nWsFIqOdPk/dTf/UprVr5FwzPlEvsfewooRDOYVyZprFocYvw5rIwL2jj7NK?=
 =?us-ascii?Q?kv8V9VrvslFHPKGgLk7hxO8cn5NJUnZqFXsKG2+NrLUHPMtdFDKuj63K6dup?=
 =?us-ascii?Q?UUo5tIx2OwZA5Sza7OriyBvcGk/hEfU4EAPuQGuQTCpuDIlm5qcm7HjKTvyy?=
 =?us-ascii?Q?FMej6V8lS9vcGGM41uV+t2t/0dAutiRDOFEZbJ6GtKecqtyo7DlygRSDSWWZ?=
 =?us-ascii?Q?YqcsKay4y7PA7SAa3Ce1ToUFl2i4EKhESHLDNhhNuYhaVoV45kTGKxr0Z28x?=
 =?us-ascii?Q?PrY137Y1ybFRzLaCpN9eAkd8JvTYUWPAKtXy939huvI+FNrMT26a2rcSwamQ?=
 =?us-ascii?Q?9023lNQJE3ghwVBKk9dtgowYM8ca2EhrWf2I/7hiDT9MyPEdKOC6wWvZZhB0?=
 =?us-ascii?Q?3KOXAGAnJ76I9k8k3Od5B/WTOlFHesj+qwcnQGJeVdDhKfqf+11q1O56RkuW?=
 =?us-ascii?Q?gzmGn4OS50ohCVhz3Ble3YJ4TInFD9sTqZorlTgDdD989UlsqW50xowEpZPN?=
 =?us-ascii?Q?xhkg6WMQTYTDWRUGJ//k1+LYeXn5UgBgJ8zpb8zvKZxD2ZjZZsoUDNJutOT9?=
 =?us-ascii?Q?gHVZ1DbbTU7mAsFLqOrWZ+aw1p7kOfEq5omUKoa3Sg4AXLSN6b5PAmaluy+O?=
 =?us-ascii?Q?kqXDFG73h25My07igTAcaj8cjfptqStOBat/c6y9VKbKeX4uxSgmXcHNbf2p?=
 =?us-ascii?Q?6JrvvXszA7XBcj1c+y9WRWi41VwVm4ErBU44bd25hou/1MBzp5Jl5OUKZ63q?=
 =?us-ascii?Q?8luvapPi5laq32InIPvGgNe1ZskWIckz9Zf2XbzcSDUn8Q7ERqxnaLLqzYGT?=
 =?us-ascii?Q?9O1+sgVnm64udDPn1KdRmFhECWf/41wWaKS3i0UqhVthZ7Br9aZFPe+Fakbw?=
 =?us-ascii?Q?9Cs3A/V5vKi4fp6bu7GLMb31A/u1KuQbejL/BQg6h9l2x9JoOx9o+XEwh8Al?=
 =?us-ascii?Q?sglK3nK2zAuevhNsLAgpa1kAA72cLMvrLKhae0cG7cKuSeG2oTa9+vs77iam?=
 =?us-ascii?Q?hHw2yRSeW4pmjGMvx1dfVSPiJOPtGoOJX2hU+UwluUD/N4dm+74y+kvXMF4B?=
 =?us-ascii?Q?yx/56nAGgQFOA5fS1Jy/DVKNt5jyL+on?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Db+g9BTDEwJK33xwyO3pK16a0WhIrbfluVg+vmagiB58WAj6/cCs/UfL196I?=
 =?us-ascii?Q?YdKk8tbHKNs1HrnoMuh1v3A5CZPZB26941z4hUHuT78/EL7IlT6PjFrJgDpi?=
 =?us-ascii?Q?5kZdf/IBEdfdUVXWGbz44m+qb+u/jmLSH4MIV4aQb5KE0zH6HH+g+TyiDP+O?=
 =?us-ascii?Q?NPHiJ7jvdJ5rdjus3oCi4mIw975wImbaJVQjvc4U+3YtQBMiHwtZrNlev6mr?=
 =?us-ascii?Q?SY3FzIELAmPmS0uHeP/M8uKZ2+Wna57Wf37AtJcGIKKBvzQQHjNFFtKlM6uZ?=
 =?us-ascii?Q?BbbPJZvLIznS7skl0qhLn7346ZxGK3RMClvbdYprLoEUdsBJixX2/EnQViZd?=
 =?us-ascii?Q?oJEIs5xl5G71ZFSYFkbkg4K9yazjb7DdLunGi5pp3mW/dcLJRUe+tbPP3hEU?=
 =?us-ascii?Q?xAqsHc0zWjO8W+iOCy341sLfR2TzBWyhZP/jTz4N3zULdoIgM9XgBiwhlArI?=
 =?us-ascii?Q?cinU1GqQLLOttZJDgbuJNYOOLNQLpgd0sWsHD/XsWT8pZ1Uib71NPIu6IVrn?=
 =?us-ascii?Q?kUZFxZPd6RwbPUXMawpLh3R3Rs8zdyLrivueSIpR3KHxxTt6nkvstxLJRugh?=
 =?us-ascii?Q?J8EOEDFYtKgRqBnvgnGWwgBPMQd+5/qiKcY/lOb4j3SyKIadRfE2AobH2SlS?=
 =?us-ascii?Q?SkyAI0Gd5FVuoCaTPb9LLH0c/znqIlSirbDpbedyxcG3TJNo98WrRCJoJ4tO?=
 =?us-ascii?Q?9e+4InGY0FLzLIXKTZaVZMEFt25ol1z6pi3+yRwxGzKCAaLc6UVGwuAoQKVh?=
 =?us-ascii?Q?iaedtAHdFxSOd2hzKBSI47pOK2oQCWr+vR/f4PPgtzcl7GeBt47Sn9zhiUWs?=
 =?us-ascii?Q?5TJYIU2UY7ZvPDIXkZyhP1qvvDkBiYx25ly7Akqhl6AE5FOj3mS/3/R2rg2A?=
 =?us-ascii?Q?aDTKlx6ASsvmCepf2X5T9gidUvphfEYcn+7QnPf2kNmgnoi/7wsl+Q/Tj795?=
 =?us-ascii?Q?VTAqrWytO4RcrFhEukKeDWNnQ5scIfkFz4H5k8T7KaHylKk49eJkVWauAUDM?=
 =?us-ascii?Q?EPJRKmirjqnF0J+oUq509wU2QBionC28xiSHjx1Ye/QAP9avLo0nUdAJcphS?=
 =?us-ascii?Q?lWgArXGzLIcJJOtQroLtyJHrpQjIZzroYCYZPMdAnGwAWLs6/BNFa5sSmDC+?=
 =?us-ascii?Q?01CuvRWgTieeacLdrrhnl10EUajXcnqQEeT17xprkYAgawkKYgo1MtAHsNFC?=
 =?us-ascii?Q?HOkVtgSsgyueOaKZ/G7WOmEj/PGFeIFm7TtYqJHEhjowsAA/V/cN2opsbjky?=
 =?us-ascii?Q?uGjz4oSbS8BB7FH49xr7Fb1hVB+jtuXGXiMhW26wIAzudvEFTzm/B7/yFuBi?=
 =?us-ascii?Q?cVTx2DoOKmKYpdeakJVWtOLwvywem/0axv2yVV9KugS3/5nChPNAzJApm+Sp?=
 =?us-ascii?Q?i/9AVGLh0ShPJapKphsmndT8zyk8joeWSWON5/webSn6gmqs+FIVtB6ecicc?=
 =?us-ascii?Q?jG9ffjeaX0jrlFstEzzfMpm8Df63yeLCU8EFqtX2hhCUixB7L7WCXZYLD7fD?=
 =?us-ascii?Q?ZGfWWUOxS5SnSGBINxU1/GraoghKRBIuJborUI/ZkqsCYQt2+bTD3zTvFu3K?=
 =?us-ascii?Q?0UC0jOqDKwjMslBLr26icXlhVNt/71pvQI+RRdGc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5d03db-ad65-495a-e03d-08dd76066b6c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:00:10.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RHGpzE2428oczOHtCLPDJiVC63eKG7l8KUNqyPpMa2orIZBH5/d9olwz9PSoi69j+eOa4d70RCVFwXr5JI80Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7768

On Mon, Apr 07, 2025 at 07:03:26PM +0200, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index 6fa31bc9ece8..edd1201eb6c0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -352,6 +352,11 @@ fec_mac1: mac@1c6 {
>  			};
>  		};
>
> +		watchdog {
> +			compatible = "fsl,imx8qm-sc-wdt", "fsl,imx-sc-wdt";
> +			timeout-sec = <60>;
> +		};
> +

because history reason, node have not ordered. But we can try keep as much
as possible.

So place move watchdog after thermal-sensor

Frank

>  		tsens: thermal-sensor {
>  			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
>  			#thermal-sensor-cells = <1>;
>
> --
> 2.39.5
>

