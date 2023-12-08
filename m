Return-Path: <linux-watchdog+bounces-167-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC1809997
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 03:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98CEF1F21129
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 02:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913FC20F4;
	Fri,  8 Dec 2023 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PumYDt0j"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87220E6;
	Fri,  8 Dec 2023 02:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D4EC433CD;
	Fri,  8 Dec 2023 02:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004003;
	bh=bXhgR4rPKkc2OF+NtTFOutIEpipf+5yKGwGL7Eh8gxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PumYDt0jekOSa9/slw4A9+gDIoPQFEwzMfxr3y4/z8LrPwqY4OQlrk7Dk1w4nVnUK
	 kTUejw8FAH8GNVzZdJWq/sr2UDMBv1FQ8GVJO+2J/EhRGTXEQGvBYMSwN7ltNJJkI+
	 ks8S40pGG7ceqSP9NRartyj88bIC6VCDowPJ5TvNmSlrq6Www576rP9QM9Nq2u9mU1
	 xfD+aZnH+yY/0bbhVs6kBqttNDIAhtwzoBC7Oi5t+sbJ3i5e8Mc1Z7RvWFdAmCnXpm
	 OQrZTM8PHBc/p+VB84ESJphQJCBmUw0tw39JBenD6/4OmLtMX5qunr//uar64UHaEv
	 ZCix56WYHpGiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Douglas Anderson <dianders@chromium.org>
Cc: swboyd@chromium.org,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Tony Luck <tony.luck@intel.com>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/9] arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
Date: Thu,  7 Dec 2023 18:57:28 -0800
Message-ID: <170200426906.2871025.5763243784808512013.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Nov 2023 14:43:28 -0800, Douglas Anderson wrote:
> On sc7180 when the watchdog timer fires your logs get filled with:
>   watchdog0: pretimeout event
>   watchdog0: pretimeout event
>   watchdog0: pretimeout event
>   ...
>   watchdog0: pretimeout event
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
      commit: 7ac90b4cf107a3999b30844d7899e0331686b33b
[2/9] arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
      commit: 6897fac411db7b43243f67d4fd4d3f95abf7f656
[3/9] arm64: dts: qcom: sdm845: Make watchdog bark interrupt edge triggered
      commit: 263b348499454f38d36b9442c3cf9279c571bb54
[4/9] arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
      commit: 9204e9a4099212c850e1703c374ef4538080825b
[5/9] arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
      commit: 735d80e2e8e5d073ae8b1fff8b1589ea284aa5af
[6/9] arm64: dts: qcom: sa8775p: Make watchdog bark interrupt edge triggered
      commit: 48d5cf4772ec6268853158d9ffc54612e988ebe6
[7/9] arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
      commit: 6c4a9c7ea486da490400c84ba2768c90d228c283
[8/9] arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
      commit: 5b84bb2b8d86595544fc8272364b0f1a34b68a4f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

