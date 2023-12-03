Return-Path: <linux-watchdog+bounces-103-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F0B802265
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 11:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB301F21033
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 10:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7888F55;
	Sun,  3 Dec 2023 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="YVpST0YX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEC1F3;
	Sun,  3 Dec 2023 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701598336; bh=D98OLD1PzU0av069+SEqgQFkN/5n2xG9ugwljKPGRv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YVpST0YXbsjwdBdARgyDVsq31Bsq3mJCmHCXc43oKUXYpvhJymXCPUSHgVxUoSSS7
	 MwmEdqKh5KpfwnKvd9+51+IoQdn7H+ERRpBUQZrRYvtEtT0A+EbWfo8r49po5ZQENi
	 2zGTEIj0lViDIFGbCY4dlpMpozKltr4ik5wieMYw=
From: Luca Weiss <luca@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>
Subject: Re: (subset) [PATCH 0/3] Add watchdog nodes to msm8226 & msm8974
Date: Sun, 03 Dec 2023 11:12:15 +0100
Message-ID: <8630951.T7Z3S40VBb@z3ntu.xyz>
In-Reply-To: <170157925797.1717511.7301998654173050568.b4-ty@kernel.org>
References:
 <20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz>
 <170157925797.1717511.7301998654173050568.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sonntag, 3. Dezember 2023 05:54:39 CET Bjorn Andersson wrote:
> On Wed, 11 Oct 2023 18:33:12 +0200, Luca Weiss wrote:
> > Document the compatible for the watchdog found on both SoCs, and add
> > them to the SoC dtsi file. And especially for the case where the
> > bootloader has already enabled the watchdog we need to start petting it
> > on time, otherwise the system gets rebooted.
> > 
> > It's worth noting that the watchdog behaves a bit unexpectedly.
> > It appears the watchdog counts down significantly slower when there's no
> > load on the system and can last far longer than 30 seconds until they
> > bark. Only when putting load on the system, e.g. with stress-ng does the
> > watchdog interrupt fire and kill the system within an expected amount of
> > time.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [3/3] ARM: dts: qcom: msm8974: Add watchdog node
>       commit: 95053f6bc8ffca438a261400d7c06bd74e3f106e

Hi Bjorn,

Any reason you didn't pick up the msm8226 patch? Doesn't seem to be just your
ty email, I only see the msm8974 patch in 
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm32-for-6.8

Regards
Luca

> 
> Best regards,





