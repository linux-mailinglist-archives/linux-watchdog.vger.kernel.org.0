Return-Path: <linux-watchdog+bounces-3602-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20345ACB012
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 16:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9541889F06
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 13:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647911DE881;
	Mon,  2 Jun 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AkQwFPPw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBE1F4165;
	Mon,  2 Jun 2025 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872751; cv=fail; b=FmjlzkfnYfbUFd7fH0OSoApIDisxy53iS9LNC31l5m7XOPNtZBaq19Y19JP8vk3IrtQJ0E2fHt1Zcqw3zaWu530OUuKEMPrNtcaGl1YIiY3TeHek98OxMOmPCr5rpwsbNl1M6OslC31YwfBbT/uovddsof8sR/1OypJb3q9XJ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872751; c=relaxed/simple;
	bh=HsBL3pl8JCZrhHvyYDOPsIyZ80E26HnH2+Rpler1UkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cSDzuytX+IKTRxb4KNaTkeayXSej+AoSKgFbaVshH0doIFwLG0Ll7pG8sEfJ8ozeLP0lowtV1LBf8o1Zrb6cvZaNN41PCYZj9KcsGJ2WamR+/mNv0iAapRPNK7l6Oz+C0koshping7cPhfJ/AfMfeCQEBvrK2O2Z+6jiCNbdIY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AkQwFPPw; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZzI1VYfPDu06LiSIK+XcHlH0BkuQ8bz2WOF83Qn/Vc9LUZP9Rru1BZhAJXLGJ7lz8TLIWub08GHd36i4j/o+hEiZ11G4001GWGBaHOuzsDr+9UDYxohwKCdW1/dSXGA9PMLMeGPWgvZsnA+z7spMlVX0YB32UKoo+UTrwK5bOFwzYk3lu9680xLM5duF6SmzO+laFZcD4l5GKP4RwznVdVbtQS8TKbO3KOSESJxteoB5Rn9PjFIECIpCTno9FhmSKrx3OmHW4B8EYkyYi9Ze4bb1mVkcaC+r8e99vvGVYDdXoRKev7dWnWewJhdaBqb4lCdhbrlODpMhcow0UOE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j1PERHcdU+An/dXzOVRax/dPMR+zh7sPv3Db2Lqle0=;
 b=mtz1XAV54sKJHyEOnEL9ku8spTkoScrfo5V1AsXlGsCHtoxI8wwkd5wKCCB2UGNC5/Ziem2rmTc+FoPQ6fg6VErWWa0y0U1rTj2AW8ADmm4ndcrNKH5ZDef99HfWRC5gCr7XKDD5Gv4ooiCh9lAe058Ym/YmBMnMLSPtMx+EHbFJgXutYvjw660GJNeV9rtJmVJB8c4X/+t4Ej/0R3SJyZPV9CJTFnmXDflbD0IYjlW5WlWC63NBcaYvfFFoRjfo6IeDzbLTRpNvxkLwVi41IegDzyBGr+wSLOIM0q1xXRkgxMicnEh59pJcaXr5WIA8vPxIU2Fac5fzzmhz8X7v2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j1PERHcdU+An/dXzOVRax/dPMR+zh7sPv3Db2Lqle0=;
 b=AkQwFPPwcMg4GCDNNdv0VfUZ7BhAuDN5M/QjU3J85oP0+5yRwaLynrdlL6QQkDXXCf6cv893uNGH/Joc8PyR18KC0hhEUyHzk33kvtL70YPrYXhIc3V82W0922LM2QVLfWYRlFXE1sbOv4gHX3XxJtF+R1wGyCh1dvxOAhgmSG6GFMqcSfXVNDlZWLPJc+qSWZ6Bm3tcFrHmdO5HhF6ZLXUgttSkUWcHChokPQn6BN9N4OzGPDKvAVzrUYq63/VxBQNn4C3AFlfkzck7g0wp1Wlh976SABWiReCsRVBJm0Yvi28jDU5GV2Ev0nRl8MWSbiASInklvtuaVIYpemsvyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 13:59:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 13:59:06 +0000
Date: Mon, 2 Jun 2025 09:58:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, s.hauer@pengutronix.de,
	wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
	robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH 3/3] dt-bindings: watchdog: fsl-imx-wdt: enable
 'big-endian' property for NXP ls1046a platform
Message-ID: <aD2uIovxD6qi/mRr@lizhi-Precision-Tower-5810>
References: <20250531040213.2589292-1-Meng.Li@windriver.com>
 <20250531040213.2589292-4-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531040213.2589292-4-Meng.Li@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: ea34fc5c-bbdf-46db-166e-08dda1dda37d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?aBhO5PVK0TKNQ11AxNDmXgau1blC+VW4YBa6xUD15QtVU4XdOxJArDggWtaW?=
 =?us-ascii?Q?qHheEam16Uk9Ku6jS524SNwYenJeNTscxd3yeg8BxPas6/BpAk+0ffjKyhrs?=
 =?us-ascii?Q?kiya+uE8r3glfXVLFbT09cdfTFSkBDWb86m2v7pYz0iuE/7qitFaE+CRnvxw?=
 =?us-ascii?Q?PICj31ycusUWawNz49qmT0WML17Kt8lGEWo37A1HOmiUHJQQk7xQqJXVs8qe?=
 =?us-ascii?Q?/vTBm8aKsry8Wpzs0hHcljculI7ZGExEX/j1IhTlWw+mW2qQsAh4kd3z2Vne?=
 =?us-ascii?Q?usVqvSpDVv68B1PgCTmc4826FZqyD80UnU7INlKip60LaG020/8TFPAHuwAh?=
 =?us-ascii?Q?SeI1c8OEm6v9gw/bRH7KjLy0G5gd2khu0yZCAepaNPYFuFzSCdBXFvBbMx47?=
 =?us-ascii?Q?GEUVbU2hNVIE26lErtrfzdaVrsa+I7HG0bnswqKMJGAzObxG8u4i9SUQeWRQ?=
 =?us-ascii?Q?331MELso3KIvvLgBw1DbsWvrQU5UEEZ2G4vxmcK328RYostoWooADkJ1Mkgc?=
 =?us-ascii?Q?n8bZ/1Bz0m5+ZaxcocD1nzZrRj0YyBBCGt494ZNviHyisjMbINkIYsMg9Qb6?=
 =?us-ascii?Q?pGmcoGGM5+piey5RC95bIg1hyA1OXibB4h8oO9vPY3Yv8tYUiynKF+uxVs0O?=
 =?us-ascii?Q?j2XWSsnBJO7Vp/eSOCtSANaMu/sFg6CgUtYEG8jYcXu0cO0CdShpK5Dj4diQ?=
 =?us-ascii?Q?qjbM04k0VT39K7ebFf7bbs6APZJEeEORxR65Ae8a/cPWu96x8Y8IBMHOKTxs?=
 =?us-ascii?Q?pJtzyJJ6XsuUhRQIcAxOXKu/f+vOkv0l6cLNW6f31w2Uc+0XuHpffg2frOt3?=
 =?us-ascii?Q?RVv2dQ/D8cnd9LbzLRvFMdotzmb6fSm/aE9vcjdrsuYWBW2vvBx3UkxednBa?=
 =?us-ascii?Q?mVl+xGADhjOutHIShrZd2Dqk7Fu+4uWnmK5cIfIxRX0ffo6wJvJJm1J1lSoD?=
 =?us-ascii?Q?+NkpcRggFZWs6r9D8dvA0OgvMcgjIN4hYy0DviP8Tc43DatHLY+QWwZwmDth?=
 =?us-ascii?Q?xBuZJGmOBb8v613BcW0F0vgenEoI23+b7og4R0BmjPW6kXHUAmL/ofNcf6AQ?=
 =?us-ascii?Q?w3gFMKv/KqY2hRqad2WFnB1TAk/G5+yD/6DAOvhM1CU/49fzsfSwdYhZt1Xa?=
 =?us-ascii?Q?zz49e7EC3e7EGbEO9M1CaCpcaVILX3sITAxPJUj0OUcBgGwnoKvucippQAb5?=
 =?us-ascii?Q?rk5aGMhdEhl8RavWlUgVKUHDXJDcdJskoFvVoUdSOH+zI7/vqyfDI0BWJcdO?=
 =?us-ascii?Q?0UVemum3J5uI05+YEOHe0gh0qw+eHTj3/acSq8OvkGOj+59Vz/vGmC2WK5MD?=
 =?us-ascii?Q?AscN04NuDw+Dhw4vQT1Zt7IQv5r9QKHPmVjt3pDj+CZtIBtbv6SrJkSQtokr?=
 =?us-ascii?Q?mtLYDT1O+meLLk5FwX8R7Mocl9LEeknD8omVWFHSXzGkw/WgMV2vfjnbeIq8?=
 =?us-ascii?Q?/zUB2h6uD2fhLmbKgWs9tmzTCVjFi3ul41cumhG+UUBdmIjxU1LjZA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qhIfwZjUsAAQnMCFyJxVUeDbo3hmqpraPIJFCyPbY6hJ2olSzJk/QQOiE57P?=
 =?us-ascii?Q?Mod6+3VlNrvTBUp1HkUyCo3LETwihGEe2IcOi7/ovMJzKDRuRO4I0wjyJa4E?=
 =?us-ascii?Q?2jf8dLAsuPANbes/Fz/b5DesHkeLorh4fY/zRk9uhcBFBwRtT2VO732aDH6Y?=
 =?us-ascii?Q?531wDwQG9JqdbzUkl/IfLz6D/uH4rwvElwtPxlyD45OKiXhrk3YqwD7Hdv0H?=
 =?us-ascii?Q?MbZB881nOZFQTvDKaGaUJI76TGIXtTmFKK98t7oqbVJu5XGHhapZvZNA1R7a?=
 =?us-ascii?Q?ibL0RPKK2mfW5VVWpD23VaO9qUTFRylHTyVQQ0vo6Hir9rJy/4KHgsv6TsnO?=
 =?us-ascii?Q?yeO7NqqloSzpfOgH9OCmsw/yOJrT3X1xkTm1yfKHMcC8P11+/olIt+0XkwgH?=
 =?us-ascii?Q?0Mrfr1oZvR8P3venoarD7fYx099GildpdXCKGMdCdzc7ozdSSAPkP6vyALQ1?=
 =?us-ascii?Q?vP//oNqbxb7j2Nax9TUxO8AcNGlUeq2/p4Wn+jAvAC5Seppey6Xjc2p1ndfy?=
 =?us-ascii?Q?RDS7/LJdFy6IjH34O/QXuvOk6t1gyRUis9yoj/OIDgd/cMo8usFzNJzCjpDj?=
 =?us-ascii?Q?0s8kw0n5koRj72peORIaEhE9pJTHvnwQ/CwONqseHr2y5Ic4xWG5TZONpOYE?=
 =?us-ascii?Q?YWIAGCY0bzcpBQNAM1yjHi3zRtNYQYS3QqTNiVc/sdAfU2VCWnZzVtDZs84i?=
 =?us-ascii?Q?gweHSFqv3lUzuLaT46OcAYAaBsocpCubLaEmSTnY4ZpelWoF5IXmBA/TcS85?=
 =?us-ascii?Q?j4YDYKkHmabkQ+ZXoUsXhTbwgSvOjh4nm2JdyymIVyxCzYCALPW3aOgdhec6?=
 =?us-ascii?Q?D/pn7C55ottJr9XvTyMk6RLrHQBjeOR03/W5RbAk9qWAXYLfmoyg1kbBUxaO?=
 =?us-ascii?Q?v4M8yUCEjydK7jdmcE5RuLlSvLHf3OBDi5Pl8MUOsCe5SKGH1WGw2xuSxGAo?=
 =?us-ascii?Q?Z6moi0Y3fUALI9NXz6hs/X+Ro6PtUDcGt2dtVWpeQ+HU2GqhqkJEY/ZxhXzs?=
 =?us-ascii?Q?FUQNGG1nUs8g1UxwMGnK+JoSCZuwwH8qCtW4OHYUIfkD8W5m8cNL9XEgqft1?=
 =?us-ascii?Q?Dgv5wA5LjmBaTQucK0inxVXo4HelRdPs2SKYutfVLz6mqYBA9VkgyYJg+qdy?=
 =?us-ascii?Q?CkGUKfFhyExboBR1tMNdiYg75fqGeYeDsparGKdQYaLS7v1NO+mxTMb1wVvi?=
 =?us-ascii?Q?ElJjJ6KCfWp/EF5XK/mDIWpv9phv9zdkZXacZsBYJg5IROlZmxJ8eNz4Lc5n?=
 =?us-ascii?Q?2IkrrcNhQvZeZRGipxJe95VvO5nMZsAF5GvljkLo5DKtW2Ld0vuBS7wGf2da?=
 =?us-ascii?Q?JmB6daA8QUYVu4NwlQKFsr4iN0XyK0Pda8jYRNbbqoSuUUsk1oj5n8ds3Htf?=
 =?us-ascii?Q?imGkspw1/gHkxObVzCqfwSFsyzvEAC+7BMCHaAk88eK1T3AyE2eNvoFkTuVW?=
 =?us-ascii?Q?h8lYDXsoiQ8LzEACv2fzDNZTYezJcpeCA2RixPu7Q81/LhVslA7CyxiupTnU?=
 =?us-ascii?Q?WPZ83VuhCDumpRTPdTUWjjsKmADwF8wTw6bOeF/GfaWzY+v7xRA3NzewJSCU?=
 =?us-ascii?Q?hgJbT6Ly0IlN6HBosus=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea34fc5c-bbdf-46db-166e-08dda1dda37d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:59:06.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1ZmUA8BRha2VVtqdj/PRCAR3nTEp/VUH+UsBKyXFejUuiHunKf/vZeKCH+SoWhQt0egtHmU2uIRhLGzpGmTgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8274

On Sat, May 31, 2025 at 12:02:13PM +0800, Meng Li wrote:
> The watchdog of ls1046a SoC is a big-endian device. So enable big-endian
> property for it, so that avoid below dtbs_check errors.

Add compatible string fsl,ls1046a-wdt and allow big-endian for it.

> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000
> (fsl,imx21-wdt): big-endian: False schema does not allow True

If this patch is first one, should not such warning.

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---

This patch should be fix one.

Frank

>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 0da953cb7127..8006efb69ec7 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -36,6 +36,7 @@ properties:
>                - fsl,imx8mq-wdt
>                - fsl,ls1012a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>
> @@ -103,6 +104,7 @@ allOf:
>                enum:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>      then:
>        properties:
>          big-endian: false
> --
> 2.34.1
>

