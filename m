Return-Path: <linux-watchdog+bounces-2905-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55FA2F94B
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 20:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E5D8188A2FC
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A924D24E4C6;
	Mon, 10 Feb 2025 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P8+G2Bln"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5140D24E4A9;
	Mon, 10 Feb 2025 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216732; cv=fail; b=PweuMyos7nSwmCatt8DvFmjR+eqppuhVXkaEkrPboqN6KObAnghCm4r0+BxCCyX9hpL+ukUVhI87KndaHuyI6PvBaKfRCOEyKKI9gWxFzHbK57/GPjpZPfpeCtY1qtNI3GQ2J5OusxY0IBxF9zEpkxbnBTqKO8fdlpngNtT1XBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216732; c=relaxed/simple;
	bh=InxVrlW90zl+RWam+u+u1fUf+I4PQ953YDJ1VQgLfbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sXyB4WUnMgRggjXsWyXAUZ5XOxZo2uBaOYWOFvDuB3EPijSxvDo1RFaUFuCW5XQqzgpTLvYbs7SnHgQT4ADuct+J7KEwXmcGiRfe3psX9ArLD6cYCKvutGghEpDaH+CAUKCpqwF2KDA/RzJr9hkO6TM8bMIWo6t4lBnZ/WMAw8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P8+G2Bln reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+fEP7mjTxdd95p+nB3HdlEwxToSk11GZGElidlQUG2p+GzLvT7lj00Z3QKgdhjUFHS9fuy3sf9GefSP4XIRZ3jYCBBKe++qi0qlYOBy5c2HDbJIZoRNThBL9lGMXaBaxUfN+mJhsj2xmnmSL68/ohw6h4MihqR9rGkXgKpJ9TNdLWJkTt7kV1TCZ5JXBDjNEbgQRTcJNnaQq4R+l7SRWFJgSNgRpSJecI5vLvJYnLzqYUeT1gayunZugVYAJcIncm7sgqNCmkZ+rNKe0/W6sOCtaQLVwBW+O6+w9+Y5nqGf4b8VGbO6lfIvVuSGB/OF9wbsuAh99ja7nMnK1S+JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aX2BcB6vOf9Wjj1gND2dqNRqbtLNxQeSnELHYRej1o=;
 b=BZ9PS7E5rl5xVBcbzponjBlOpOT7Hih954j+EPYilLeflDaTqdGw1bicR/FNzKYkeuNSud1gevaHNtTrebfLP4HvbTvigpMMUMHqVheRI6X7UJWxJfZHzG2V6AUBW77kOSBw0dvZ3G+HWE3FvWWZSAQ+4rgxMeBDfS3UKXc4PJo68Rm9dta5iTZztddIvxaJBa7rz0yHxIr46YYZV+Oio26uGMfnTCn1wKntqeLiiJVREpYNF3xml1rx38yMhqDMRDbwhLkIjEUBpKuJm8dZIagsUPCq3GItk3gwYOfqSnjAZxrTshmfmFpUr71PUvHtolUgd43SDJX0U6VMtdsNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aX2BcB6vOf9Wjj1gND2dqNRqbtLNxQeSnELHYRej1o=;
 b=P8+G2Bln3Pfl49QAS/xIJmgxv2zrm2Y5ohSAdyv7BQ7k/3o2QshKLDVIPG5B2xuU5CbRFmRi2/e8kES0nR+fwymg7dT3td24garKxLJkoQnHpx1z6bOqUO0GbUnfjN8eL3qi1V8lDBFYoFIvjhugGBVNwAKxivbr3phvvbq/dI5/hseNPGcJN2QqghUkOaXLBaOWfBKJo3MUwlLnlJOiLP2Mr4JXLc+nAW0yFEaz/hEA2Nmw57WrVwoquv9POcul0O7bh2mwxC8Y6cQcC5VKMIRPXzLAdsD+ESuSx3ekTdfpAjSOFTqqzhXd9+NW2CsgsuZv+qhXo3lPA9XADFBT9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:45:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:45:26 +0000
Date: Mon, 10 Feb 2025 14:45:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
Message-ID: <Z6pXSWQdJCS9ZXOJ@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: fdee1320-6ba8-448d-0f26-08dd4a0b7754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4QjY1hyObPLlvaBs6t48H4sNS+qTHI4vYnEVHFJUi4vbjH/lXu0f3d+sgM?=
 =?iso-8859-1?Q?abfSFtMbZ6XBfMCNGYDwP7xSMwbU2ueM0L+RjmgzD7WSLeDNGi7veEMf44?=
 =?iso-8859-1?Q?Cy58r3gQPVC/IAY6S9b0BWQ67GSgGpdstrh2s8D+JjMD3Y+kJBG3Z3D5Z/?=
 =?iso-8859-1?Q?racZo/1xESrou9XHD79GjcpS4xm21vpRtryu/67txFGwR+Cl0G/Mua6C4K?=
 =?iso-8859-1?Q?ULYnB8GX90XuTbuBl3txjgmZc3ZCicvwzIyHeGWI99ogltrlYIWaD83leN?=
 =?iso-8859-1?Q?Zo68agg3qfirzqNW3f2xmy31YPEbs2A2XOGhWJ1lAvM020FYPFbyr2XhVu?=
 =?iso-8859-1?Q?gjZFGxnopTky6YHT7bDuYq+msNzkOMXxqG/MaYt5BG02bcUpq5BlOcStKz?=
 =?iso-8859-1?Q?zkx5LyEBToLZS5HpWv6X5F5qnjGPSDaT9I262SWx6TZz4Sd/UReCFBjBe2?=
 =?iso-8859-1?Q?SN38YThogn1T3tBg2zhrOMFa2rOqjquklym4WZnTdeCVVvzlCvUz6lNR3/?=
 =?iso-8859-1?Q?7dSXIUyG8IQDkcgEMuwbSIe+klWB7/PrndjzjH8oHX5L7NPMUSnpPtiK4o?=
 =?iso-8859-1?Q?QUUTJh2fzO/+y34DrUrBvRx5OMOqUOcHM2WuLlvARtNtlasRIoRS79ELEe?=
 =?iso-8859-1?Q?LuNIVNQqOkNzXEYWhFHcyHrAPyfR8dinvmfgvSP2L2DzGF7bVjzfXNLF6v?=
 =?iso-8859-1?Q?WjDBKrrNJQ8tHogs72SsHgpo3IxOWFhEm5/AdrD00ETYgLu5tk4DGrBXeU?=
 =?iso-8859-1?Q?p7v+qEkuZyQFori3YNL1nJmRdmKLiBdegtur8vu3zFHGRmnF2w4a/BA/LY?=
 =?iso-8859-1?Q?AaNxinfejmpymN6hODheSphkX074cBuGfNRHGQ612DCeWAQ8QloS5QqFrt?=
 =?iso-8859-1?Q?Km8/zgfmELtMLsbwJVrsGrLDODW+2gMC20NF0YqR/l4rGVjOrNxUeENdu8?=
 =?iso-8859-1?Q?NwUplKh8WAU/eO1IoHi1IVdaS4aDomRT3p+gU0DYgq+on+yDf59dl/jfnS?=
 =?iso-8859-1?Q?pSh1ZjdQ7JuUTvbjT6QSPXxuq9alSe8IQ+4/IaWV3+SY1LS+Wy+TNjJ0YD?=
 =?iso-8859-1?Q?hrLFmwiDaILXGyGQZOPMRz9MX3+WQAoZKtVJY/DyUBv05xgL+rZaph7+b5?=
 =?iso-8859-1?Q?keJwK0ISzyREUkwdNt/HUC2hV8MgoC14jXZ96Y6jRtkmhIUa2NoVAuC6Ei?=
 =?iso-8859-1?Q?WERCeP3OrDxe4eUkP/4Bm7ywLL9H2cyFUy78MNidg/QnDq8lz43lliz5ml?=
 =?iso-8859-1?Q?OK3+Z9VG1PhTueoPDtjFAtWfR4Yf1gSATQNvawZx5UD07VtFTIbHnfBUZF?=
 =?iso-8859-1?Q?L5QMfm49g3n/3sEKtJrkfKfQtiUCizUGhOvZ8lQ7iunNzFtZfguANG3W4q?=
 =?iso-8859-1?Q?j8YwkeBmAwVmowhiYcUvpLMLiaWdZ420k1pno+BDkfMXT1ojb/mAi/kf8X?=
 =?iso-8859-1?Q?S3IYcWUKcI3ugQGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sknx/ZsI+MBUeoj1xnGP4b5AJhmFFmKM07GGvsi/MgOJdo+zLVSPwcKVMR?=
 =?iso-8859-1?Q?9C7j2gGdFTDXcZ50bK2g7YHU6avoflBKDyjRuKydYcdgebVy3PnUzI7aO4?=
 =?iso-8859-1?Q?HIRhdToCx9nhyPZ+4oyn7yt6HXJM16L1NFrvN2Wvsbf2hotAHH1orRLdVS?=
 =?iso-8859-1?Q?HhhKEWo+cXXD/ZXoDdex24O/dK+gFOqwc2rI6x0jnsjl32zBbW+vXnfo4J?=
 =?iso-8859-1?Q?81F7wrK2gbZnr/YV16ZdGG7D3I0Yz88Y7y31uHROa7SYV3zoBPOVNb47O9?=
 =?iso-8859-1?Q?gHBPTKuOZgjqCdjvwie8IpcDJzIaGX6RjpywW/CO8u+mo0xKm4bFyE7sDe?=
 =?iso-8859-1?Q?oOyNcqpP9UGg3AaG4j/uTS8kx2sFwJIBqDMWtlB4pUUneL+D6GxNzl1Fto?=
 =?iso-8859-1?Q?fmMA4lnYsxlFXGTG/ErjY7WjXep++LZ8au1Vl87M8CZk8Fro+/sRvkipzR?=
 =?iso-8859-1?Q?cxGkWFaM4xvD/iYtLLIJU2bbG77pxl15CP1vk+ZVaDcUAT8tW9pRvrWMqA?=
 =?iso-8859-1?Q?xvjtqdosw7ki+4rwbvcUqlcL0mCqZAf9B1y33WHi4GGn1+FYn9knwMFz5O?=
 =?iso-8859-1?Q?/oUAJ4lKQ3Bnm0UW9PGJW/bPV/7Hw6xCVLwtgfwNml7rzEF2OnmzdJW94z?=
 =?iso-8859-1?Q?xA37YIQJtqi7RFcfG3havpMLBCoA3egi4P6GgX0APNzBGWaLut6RAjdpK1?=
 =?iso-8859-1?Q?5v8iYX8IE6I3uoAPSK+QdwJQ4//DLw8uA+TvPwFx7he+cYzfV88YXdtfHF?=
 =?iso-8859-1?Q?7xPn88vbFJwGLB96lpxIgPj7QyA1PadDc+9dmlkQ25PDoAjPwdECcv4l3k?=
 =?iso-8859-1?Q?atXaX0wlkbQwl4BBeNm9d5yhasFzq+Qv/DQDnCWyGXxPUqaYWansXxiC2j?=
 =?iso-8859-1?Q?FYfxofC7XM6rpFSWIvjnsLcqxR7XTmPKaS7xMITB2jGeZTAl1OHunG+0TU?=
 =?iso-8859-1?Q?sB6TYmlSBKSol0OWTEJFb+du4iGYHNTLMabUt9wrs4JyysQv4thvqtDCax?=
 =?iso-8859-1?Q?7FolNqqo7gfFb17b7e1K3MTirpVRIe95RyOdYnC4E5y5Uuq90OT6eAc9iz?=
 =?iso-8859-1?Q?ilnV1MZtMnC+ZYdbR+30o3LACHkgrNssfq9m7DiWFL4Rm1XGNu1BUOAT0/?=
 =?iso-8859-1?Q?wKM9Tnyv9taXBHv+MT4ZP1pSZLowWtLyIiKAoxzhZMqBuYpJo5Q+3c8D9L?=
 =?iso-8859-1?Q?dqI08Wk5TubU48AT18V7OwYO8/4X56ncUExzMwRl8wKO5lJYX6vck/eYx6?=
 =?iso-8859-1?Q?w2CAdy220x+8E/Sp7HH/1BskLE/zebf5KufIPcLl0rK6FotwYQ3G+sP8Y5?=
 =?iso-8859-1?Q?V6r2hynhPFT3TUKu04j61oOLO/M2jUJHRe14+xDGBwfejI52yx4jsnZSPi?=
 =?iso-8859-1?Q?jz7av8iLv4c6uiM+r7J+vf1NpNYiMZezd8VjdKG54Nm6f8YHIWWo8ko0ZR?=
 =?iso-8859-1?Q?w5teRuQAPJ5YBwq6eORtmFnwN2ObE33lLMM7ulPuSRmDSsZmnCzCDTB7Xx?=
 =?iso-8859-1?Q?HaY68gAmHTnKg5HGyCtbDvw7aYlY97D1CYwU8noSTrS2wZ5pbpl7+Sfuco?=
 =?iso-8859-1?Q?KFM8PkfXF3OuZ0h4k/lHQ+dybMMh6ldTyyX23N579CC/TjVpX/gJ0k58kM?=
 =?iso-8859-1?Q?+wSrhZSzE5Tz0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdee1320-6ba8-448d-0f26-08dd4a0b7754
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:45:26.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bmx/MP5c9XuR3qR/gzCItCtgFZCznQqPmfPISeSr+6C8SwuboaKLOy2wUDjdrq8nn8h94UdE/9L4YKyU/IH4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On Fri, Feb 07, 2025 at 10:30:27PM +0100, J. Neusch�fer via B4 Relay wrote:
> From: "J. Neusch�fer" <j.ne@posteo.net>
>
> Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
> driver.
>
> Signed-off-by: J. Neusch�fer <j.ne@posteo.net>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>
> V2:
> - split out from fsl,elbc patch
> - add description
> - remove "device_type" property
> - move to bindings/memory-controllers
> ---
>  .../memory-controllers/fsl,elbc-gpcm-uio.yaml      | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..381584b400a0ad98c6d9e0b38f2877d44603ed84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/fsl,elbc-gpcm-uio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Userspace I/O interface for Freescale eLBC devices
> +
> +description:
> +  The Freescale Enhanced Local Bus controller (eLBC) supports flexible access
> +  to memory devices, through the General-Purpose Chip-select Machine (GPCM).
> +  The purpose of this binding is to designate devices attached to eLBC/GPMC for
> +  use by userspace.
> +
> +maintainers:
> +  - J. Neusch�fer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,elbc-gpcm-uio
> +
> +  reg:
> +    maxItems: 1
> +
> +  elbc-gpcm-br:
> +    description: Base Register (BR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  elbc-gpcm-or:
> +    description: Option Register (OR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  uio_name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - elbc-gpcm-br
> +  - elbc-gpcm-or
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };
> +    };
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

