Return-Path: <linux-watchdog+bounces-3989-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE452B21495
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Aug 2025 20:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A735B625F4F
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Aug 2025 18:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7B2E3380;
	Mon, 11 Aug 2025 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbuLZlDw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0232E336C;
	Mon, 11 Aug 2025 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937677; cv=none; b=XvAPpSY1ZKpK4aNn4iJHsGoCOoWMP1T3P0eizejuFgiUiCrdW0l/gNLVHFpZ/oarSBkJ+N7++/+ZrxkyS4s0GkIsUzDN/THK6Gsj9/lvD8ox6lx2kZ3OIIPqn3o5LDKBRdRdL338t0rbM7FnZVXcxMwVmBrQIoEyRjAiTxH0OYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937677; c=relaxed/simple;
	bh=f+CLPephwGhFpFxL9fAwCN64RSUg7mbAh29TU2oyj+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwR5VKNSPGJWvrvvB/BgzKeFwAk4eY7bRVqhKn3Llvdnl1fTRUMJTBivayOoFXwzFOLiOyudeu2RwlB/8qNf6HD3lr5PicY79SSGbBOLwgbX+omzJxw8a6kOaGfSecopkz/s6hRX9iYA6i1WdaHtD0AozoTW5X3WT9oTc+VvAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbuLZlDw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BE5C4CEFC;
	Mon, 11 Aug 2025 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937677;
	bh=f+CLPephwGhFpFxL9fAwCN64RSUg7mbAh29TU2oyj+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AbuLZlDwNBgm+xQloKdNcOn6oKVlHAvtzdBh7jp4kMYy3u3cO0CiF28boKQJdcKwp
	 if5vcaOCONb6qQDYHasNoEyJn8A6i4eXFZoiuuUo1IqhzpEF3LecTJz0eWUjcFq32C
	 gTpI41IG63C8inqlgGeC6LkZ3L0RWTQDzvctN9LcgaXO6uiDDvZle/TWkENRpfdZAE
	 q70Rocxrl3GcNqgECwkaiHgx/UXVb0oH7B7h41I3Nud9b54zqZqKCy/A2XxdGl1UoC
	 cp7mtitBFqJNc3jGO87UiNoo4nhERo1ygjb+OXkIQjAmIeJmJ/jIT5HLIM6XO23ps7
	 1eWX2CnHNh6dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	bod.linux@nxsw.ie,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add support to read the restart reason from IMEM
Date: Mon, 11 Aug 2025 13:40:55 -0500
Message-ID: <175493766109.138281.3436384432329568509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 May 2025 18:47:48 +0530, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      commit: 3fa1095979393d5b178264cc1bdfb473e80ab774

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

