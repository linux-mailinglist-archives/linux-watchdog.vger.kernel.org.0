Return-Path: <linux-watchdog+bounces-102-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DA8020CD
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 05:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C6A4B20AED
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 04:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224C115B7;
	Sun,  3 Dec 2023 04:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT+DR9C3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE31C2912;
	Sun,  3 Dec 2023 04:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC07C433C9;
	Sun,  3 Dec 2023 04:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579110;
	bh=jQ9uX2NqNz2mpAo8MQUUZUsit67Uq9hXoV0xcPByrrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fT+DR9C31YjC0vlS5Hl8QELS1xzDeDvaK/VDnXa6sjFObpuNaTayaa+6CLba6dodz
	 r7asff2T4SHC+xlwg93vsXZcV3yV3SffUicMK/LIOqRP/ljhBcv+7PKhfM51FcB2TD
	 oOwRNMsv2fSl97GfMIz4Oa3CKrt6fcAbFrGu68WM+NFzowNMY/sDLM6ov9oNApJiMO
	 OILF2QWW4FaZ2MPRsEGs+N5QJjG994FcVRNYp1mjbug+l5DN5z9DDce1xi8l6keBrn
	 5D4bASjicEO5qoDzvjxtA+gI93vhFPfTaS369X+qOoDDercrsVzMEfks7lc9DyS2fz
	 Yy/E4y/DlMK2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Subject: Re: (subset) [PATCH 0/3] Add watchdog nodes to msm8226 & msm8974
Date: Sat,  2 Dec 2023 20:54:39 -0800
Message-ID: <170157925797.1717511.7301998654173050568.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz>
References: <20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Oct 2023 18:33:12 +0200, Luca Weiss wrote:
> Document the compatible for the watchdog found on both SoCs, and add
> them to the SoC dtsi file. And especially for the case where the
> bootloader has already enabled the watchdog we need to start petting it
> on time, otherwise the system gets rebooted.
> 
> It's worth noting that the watchdog behaves a bit unexpectedly.
> It appears the watchdog counts down significantly slower when there's no
> load on the system and can last far longer than 30 seconds until they
> bark. Only when putting load on the system, e.g. with stress-ng does the
> watchdog interrupt fire and kill the system within an expected amount of
> time.
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: qcom: msm8974: Add watchdog node
      commit: 95053f6bc8ffca438a261400d7c06bd74e3f106e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

