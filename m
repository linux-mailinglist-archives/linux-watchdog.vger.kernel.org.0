Return-Path: <linux-watchdog+bounces-2616-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435E9FCCE4
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 19:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89D357A0607
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 18:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8819A1DE2AE;
	Thu, 26 Dec 2024 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maaiEkpg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1291DE3D7;
	Thu, 26 Dec 2024 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237659; cv=none; b=mgL5JxV5L9x7qFM3C/feQupKJAuGJHdS2PIj97lptiCalnprCBZFliqSVkBGZj+ViGB4BwUbJMBjKqSD0SGCjG0xEekL2UI17Ta3380kzAxPsvfaACsPJyZEWZXmqtZNpYe46anvvr3lFw1pwMve+mMalrMku+dGlmoUPxDLMDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237659; c=relaxed/simple;
	bh=QfgcJUk1pizXTSyGOyzeOZix24tCPB3rQDgym8387Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9vhBfLxaiyuiXcbqjfY1oIl5tJ371yLVcIJnnw15thqIRO4kHguYVe5YjqvePmCfx8rpMvvfi+WKxRjtwK2z+X0Rfe6OKsEdAyyTBoCqMcx2kLR+BRucb9Oz5CQAL8pMlTSS4xejV9wQEPrZfbHIw3y13A8SDTw3w3o4+9FhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maaiEkpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC847C4CED7;
	Thu, 26 Dec 2024 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237659;
	bh=QfgcJUk1pizXTSyGOyzeOZix24tCPB3rQDgym8387Ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=maaiEkpgVWzGGx88z2+gy6SS3SrFBcVHFU4hyMK0jOVeeFev/27lZF0Vdty177C1v
	 brG8lSSe0ICXLzrDUARsNAa5g/qUPcJXDSWC7Fhtr97KozUVmAnHnL6EiZ9P4HWi65
	 1eQgWStkt8uJ7Hwm2f/U6rQhQscT57j//KIr8Vf8jGsVUZBI02qvwjvfrbyiz3ucUg
	 7LO+9TqPgDJlrBhEuiR+O2aRYkBCM+l73nFB0NxZ8HUizErbnSRQNQhd/SAjVgxxns
	 oalRWVoLwLUFjArq++jzQssBvIcHknH0AAU+A0zGFe865am7YpuJ9TiSZjFzketoq+
	 Ac9BII+HuoE6g==
From: Bjorn Andersson <andersson@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Xin Liu <quic_liuxin@quicinc.com>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	quic_jiegan@quicinc.com,
	quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs8300: Add watchdog node
Date: Thu, 26 Dec 2024 12:26:56 -0600
Message-ID: <173523761370.1412574.13693734112650267984.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216080640.509182-1-quic_liuxin@quicinc.com>
References: <20241216080640.509182-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 16:06:40 +0800, Xin Liu wrote:
> Add the watchdog node for QCS8300 SoC.
> 
> This patch depends on below patch series:
> https://lore.kernel.org/linux-arm-msm/20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com/
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---
> Changes in v4:
> - Patch dt-bindings is already applied.
> - Move sleep_clk to SoC DT.
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20241125093503.1162412-1-quic_liuxin@quicinc.com/
> Changes in v3:
> - PATCH 3/3：Add \n at the last line of the file.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20241119102315.3167607-1-quic_liuxin@quicinc.com/
> Changes in v2:
> - PATCH 1/3：Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> - PATCH 2/3：Drop the Reviewed-by tag that received by v1. Assign a label to
>   the wachdog node.
> - Link to v1: https://lore.kernel.org/all/20241029031222.1653123-1-quic_liuxin@quicinc.com/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add watchdog node
      commit: 3d0d8c8989d352b545ce1e52ad82e9f3503335f1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

