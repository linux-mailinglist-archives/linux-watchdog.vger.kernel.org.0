Return-Path: <linux-watchdog+bounces-3609-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6DACC99B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 16:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CDE77A42AE
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7891E239E94;
	Tue,  3 Jun 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DiakGqOl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E06239E79;
	Tue,  3 Jun 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962232; cv=fail; b=G3YZITNMNQKJ6vozQi5rMJ4985Aamu7EfATS06qVSMfK7TUiVmxCEvr+I+z6ZJnEEkiKKDKHKyM2iFUSUfF0HRLT6NIko9S3ARfOIQwYMfDNS9ycYKBLp3CzW4HnUPdTlIA6eJ183OSxeHzBDVi/fRthh2X10wNFsZT9wDONH+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962232; c=relaxed/simple;
	bh=wNpUnltFTmbh7bleSOELh6g1Gy7B1cGjSgYOrPN/0kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Main2Fqb5FZSXv7EOFwGMAgjHxL92vyxE/gHSmA3r4aWve0mWadBgIWBpulPxPWBQZOReQs7hDArjZBI9pofpijCTrSjm0IGcQan+1lORulD+/lmUvuVQcFcZ4+jDa9J7CaIs9+uz0ZShknSKpS1fsfK9Af+7X9F8zTNSJ6x26k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DiakGqOl; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wkc/4qmjexDkqzBtx9C46s1UhUPP02pOL5wYTv1Lz9cR16GQ5C4LDARjXBESl8DJrbwBV6Z+koZjQyqiy1836KLkj/FhVYMZbGu4KH6EzlOdaPf3Tsny4CkSHfGa80AZWwSSaJ9Xp1+7WQlnM3XUkikn1+g7fwWVDP09naIQunsF0bm2t7G02DEkxA6OKzyKPgzj+cN2gtwAInLmYHG72jI2P9g4kIiN1W+mxwdGDpVbvtfQyI2ifP2elejnwwxWG8vUH0gFgIIAo6Q+9emdqTaVybMwogkWMRuShiU8AOIj8m80AjeK+64i1nR5LUNBFteHqEFUfR789zHaO0klCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kll+Nx9B4YkVFlWatnKEXqD86tPOInlKo1AzX+5Twko=;
 b=A9GMRS1xXT4HPmAl4XLeMUHjw1UAh0MrXqxaMHadb4h4Cg/TPR0mEAiPLQkO0ObkXP1Yclf9ath3arxtaBCm/zsMlSxay0aG9Mfb+/FNjt9To8h7Y6p9REVuYF2+EuJX6A5u3A9ihc+8IF1kmp+c+sUzngHaFSso9Cxy0XG2D5m2ccd3KeFZY4dHvGBQLdotH3YrEqS8mFZU21/6ZGm6TELhpcXULijcaJXTauzXe5dA/43WyyB+ByT8kn4kj087apErNflKTBs3NJbpZGuZBOuQW84+Hduv46YzsfY4vKySJeC7Pu8+9TSvUiW9UFmqh3c84hsURuhL/yrLOrlyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kll+Nx9B4YkVFlWatnKEXqD86tPOInlKo1AzX+5Twko=;
 b=DiakGqOliOB1PODacaOcn1j/NgeldtwPZU5g2v0nMHKDGOGpy05MWBeIzf4HFGsrPHkAFufnrfdCL8qJOLfCZGA+Tnq4NJEz8twSQCXTHKnYbKT1D7eWHrbBROgafoGk6ZnS2cP+OlZHc4q/pxdDl59s+hbWmMWXzKFMVS53uV7dgUqxP/Xw+rQuToBktOtVu4/io3IvMhyLEcVcn2bFB87fNMVxuee7u1jFJ6JYO7F8HI4tz/nE9LcdpOY+IDi22ISJdaTuqs9o+7GW3jJ1KIag60HtOCO6WTqJMNoXsmGjSfJxxLl/SyWluodO70ypxvoelh3XsH57ihYpiITcGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10616.eurprd04.prod.outlook.com (2603:10a6:800:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 14:50:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 14:50:27 +0000
Date: Tue, 3 Jun 2025 10:50:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
	shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <aD8LqjMrzFF+di6d@lizhi-Precision-Tower-5810>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
 <20250603040230.2012772-2-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603040230.2012772-2-Meng.Li@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaee69a-6062-40f6-ab9b-08dda2adfa7e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RfM+h9CQ3+/fkTgQ+7hlVeQceLiGBc81JmxxLsG0xaaD7RZpvVwcldBxVo8m?=
 =?us-ascii?Q?Mx6+OV8gOl5rUihPzL92UCXrsDTOJ+KOUzbEpwOVT8qcxFA6UD7pkABYaYJl?=
 =?us-ascii?Q?QIhsLS+yXM05pA+ySU0zMQzDwlnvzA3K6UAiJGk5B9BDvlstYCQ4ZV+Pw87F?=
 =?us-ascii?Q?SYSItRv/eQI6sK/UJgiBq6sXWoVxHxw67I0wYTbgl/sX75n0EBwTWWpRBVx/?=
 =?us-ascii?Q?PdoIgOHS4qUF6BlFUiU92z/MPlMT3nFkjCw9rdqEKkpJIRR22D3kiixEYFyo?=
 =?us-ascii?Q?XQuzVpMD4Z1iUKTVYggI9MDbc5kdJQfX31Ub//xAf/ziJ9tOgpzkUTGL5NJ6?=
 =?us-ascii?Q?wE+j44Qut2ETWgiBoVofnl8H5+BnfWupPDe2vIhwDTi4HWNtXmGBww6Hm9kk?=
 =?us-ascii?Q?udI6gMPpp0wM/DNbkKo2ZniNRG1eU80L4emsksCslclGXHuVWDlkMSKrjKKH?=
 =?us-ascii?Q?GkzpPCIPVmL0MrzLEY7LLm8itIP4Ues/i8zupWjXDFE7ACUe7HJ2SEdHhMZR?=
 =?us-ascii?Q?2A6zBx8SkGuXhmg3QQ7AM4JMbLF3QeaQFwtC8mvzgwVKyCX/Q+xnAWb3aHUI?=
 =?us-ascii?Q?crGevHDvr6FqLTDT5o9u5LkZoUOLZVhd3TQMeVo5m6pFXWjtbdgWbYCn64+E?=
 =?us-ascii?Q?VagFRK4yXUPKY7MYXfcauYoRRbS7c6sGbJWSslfoWhaVpnJ6sgGYdGahqEW2?=
 =?us-ascii?Q?LgTnNELgh/pfguwUZOgPpDkFU/wUY/nrcZR7v/85MzUvTTZVhWYtjjwAxF1Y?=
 =?us-ascii?Q?Ca1MayUbh1GsrSjvbqOi5OUR12026+nTooOUePqETuTGEIGZfBhri/rY+qzN?=
 =?us-ascii?Q?a3r+YWCB6sX2QGjNzbA4MolSf1icwJ/lZ3AYjog2dhTH+m+iZy8y/91PyN0S?=
 =?us-ascii?Q?MQEsBkJsAIQ/UISidShD3RaNZeIrzcwbaYGaKMu/L03n5r9tCFqfXhPNI8rL?=
 =?us-ascii?Q?N18QeSZhg7tYHjGZVaLpfzCPFejfGlUjpOsUipky7Dd4eG/yKLSGZv+Uhvf5?=
 =?us-ascii?Q?oK5EXqyf03cu05fSQPTg/6EYnd8k/6uJK543GRTZfZF2Rop6/PwzvtDZ7Fc4?=
 =?us-ascii?Q?xkpo7O0ioZZ2Xf/6rV/+wUxs505I3ZA2gCsWg6bD/AO/WeyGgE24oi+FeSsI?=
 =?us-ascii?Q?NWsn6EXDDFiOU3nxeBzvicVXXgV8TgW75clljMd4OL5rO/rrwUl5uFolv1EU?=
 =?us-ascii?Q?F1FUFuPrZfRdBikrBTGRNiOXbOzvkfxHltJ1yLPM2Cs3gHzlJ0Joz6vsfaSE?=
 =?us-ascii?Q?TH9QLLzIk0k/tU1hmybTsDZ9rd2TjfBiJm48/YTN7HA1RnCD7vY3WcTC89eY?=
 =?us-ascii?Q?O8caBBzuJ1RUjIcT5eBW3kB2lR/hOlmuCXi2Dqou9bGgqrZwqGiF8LgWvvSB?=
 =?us-ascii?Q?5pjfoGbTJhwy/y1iVKaHnZ6VkPUvJPBlYG5bS5efBhIAdwCTVbcqPtVvW78G?=
 =?us-ascii?Q?wesU2qLptHrXpDyGG+eo8CHZMsllT/ZZ4Cg4RpRjfQtu5lx0mosJNUKDNqzA?=
 =?us-ascii?Q?sX3M4DfFU/013EM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0+tRbYekZQAkLI5QQ03+wMaZBacS/RO3LYSFEz+WSuhAPEcXWFlrwteLXt3S?=
 =?us-ascii?Q?2PIkWsLLMxnpicU0qnh06t9FESZxTRxW6QeUrA+tTVquFSuoh69p/6TflVWn?=
 =?us-ascii?Q?hgkWrdGNq+57CbWYeYoVrSBeWIHXvvKOHwDX7eAMt8yqix3Yd72hrUIlMY85?=
 =?us-ascii?Q?gQhJ6p/XgaeVGvP8Bvl8VIrkW30dI/c6FypWo/XfyPao7RsPL/bpVXlnRrjA?=
 =?us-ascii?Q?yA9jgwDr+xBZSGZsZhl0qWbXYC5r+rBtMyoRadABlNb/dDHAsBOxo1b4B7AA?=
 =?us-ascii?Q?x7JkmL1fpJvFf7isUPM5VBj8IGiCBCKtUh9VgiIIWQp+y6xqugdPMNmX1zar?=
 =?us-ascii?Q?JOiqN02GhjH1rVSfr65SDgKd+YyCwasELaEPHt8JxN5LXjSScw8YmAMiy9pr?=
 =?us-ascii?Q?6wmjNUIjwiX917hqPKop17A+ByRQWa1EeWzv1uxVJ6Xyljf8v/Qhem7DG6KC?=
 =?us-ascii?Q?14s8uxxIOQkg7TM697HPkBpusMSN+8daLqjzZFMBH9XZZPWNADF9YWAaB7Eg?=
 =?us-ascii?Q?qZzby0ZGudIvtwtWExtCL2V7UVVDZFTYa0vvKYTN2VAMlPyWLkevN7gwDcy5?=
 =?us-ascii?Q?tuG1fTJF5B0ItnZqcxmQBKPuTlb63YIsajmrnnq1QaZ+F0Ub0qKtokE8Hmww?=
 =?us-ascii?Q?X+7X1oekRVodoUjRd4oYBl1HYBf1Q9h2Co4rd4yqOts78GgN0ljzlH10J/6V?=
 =?us-ascii?Q?yJfxcONG9pqTzYrjG6Cdp0WD59Q3oBjJFhFJYZRjhjkoa9y09i/7cUGTSEfb?=
 =?us-ascii?Q?lVRRaeHwV6cM8w2kp9nPYfMAjEsslHO3kCM75ltlUU0+gFkR1AHQW0WhJGjJ?=
 =?us-ascii?Q?4+7STrcnZbC5tWKK8u0s63Qdx8GK6IIygKtANR+q8qlJbGbomJUPyejuw41q?=
 =?us-ascii?Q?ns18iK9irukZVJ5m9RQw/wI3BlOB0ewgdxoU+BSKN8lzdiXT4LJ1k9JxGEPN?=
 =?us-ascii?Q?WZ5EHE/xH7ZGKjT2w54rGEhTb+dh6/OpWnbGtoIASkGHaIovr4/TLRYUXlMa?=
 =?us-ascii?Q?ZID91hy2TyU2hghJlAfRFgfp7CrkC+hoJMgjqV4uRjr3YJq+zZjBeccovat/?=
 =?us-ascii?Q?wP+qIbCuUz04jmk8J7D4RXzVIHYFLy/DNPAHjE0WUU547M84Qb+tb1lY8E2T?=
 =?us-ascii?Q?CfWEnN7JUbbuTeYUB0f5B5UOG0boKmO0FMYER3+H8vBZGI2jRHfAO2bV0tGT?=
 =?us-ascii?Q?muxbUVr9j8d2b3rsv4O6wA22RBBFEU7uLfJnJ1vzAK0Yosqv3Y9CgrCX2ZtF?=
 =?us-ascii?Q?S/tvIksjhYNKQjUFeUnnCtYewz0e5/ycI77aKmjB3GxIOzMG03ocDufSQppO?=
 =?us-ascii?Q?zA54HjvRKcQTJsp3kSUdbsSgkv4mG2++SwCFhWLQqS7nESrd7UPEPAipBqwJ?=
 =?us-ascii?Q?jS4eTJiAOyr3zFuS+nmEVb4xakI8pLy6MCS1JUVtjogt6n4qevRZzkkeYoTt?=
 =?us-ascii?Q?G4637S48TYVkogoCLYJ1PWJy4oRr68Z8Fr23mS2AdbyEePd91ebeFst0KH2s?=
 =?us-ascii?Q?mg2v9pw+l3dY8LF/0bypIEa3cxdaKk+jNqhEkmrbiYPncNWBljshN7BkjSni?=
 =?us-ascii?Q?O4ZnstjRBDYQKdoId/d0EURw2nVWDPDHKAOnvJIs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaee69a-6062-40f6-ab9b-08dda2adfa7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:50:27.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLR/9y41dcoSQoDDj3VhmPqdAa+OXoLoSE3DGDJ02hNgYuLXLPfz+l2UK7f1LS7KlFAcmEYX3PxSeDqqOyjj8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10616

On Tue, Jun 03, 2025 at 12:02:29PM +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
>
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 8a6c3a75a547..34951783a633 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -37,6 +37,7 @@ properties:
>                - fsl,ls1012a-wdt
>                - fsl,ls1021a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>
> @@ -105,6 +106,7 @@ allOf:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1021a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>      then:
>        properties:
>          big-endian: false
> --
> 2.34.1
>

