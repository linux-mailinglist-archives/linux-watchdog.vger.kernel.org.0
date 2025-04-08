Return-Path: <linux-watchdog+bounces-3241-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515BA8027B
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 13:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F4316760F
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 11:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6182676DE;
	Tue,  8 Apr 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrfZcont"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438219AD5C;
	Tue,  8 Apr 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112498; cv=none; b=e6rHsTjt8PNgI5+m3OY7EXw42+oYLrSwb1rpLklotR32t0sTPZ1p+AuZHTegm0R7i3HDv/KwMbNM+5YEg+ULyM2bcExItExTQjsGGkFON2XaigDw2vH7Esfca2eSNLX+C37gb4qeKtAdTlB5yAAUB4RMibsPHhdsU/4bLR7m7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112498; c=relaxed/simple;
	bh=NEnGPEO6W3C829+ENWtu1rBVVodPRfUQmPBIP8EWNEY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=t8FduHNW/Qz9BVF/arVZm2Gh7pbeuYiDtn+OVA4sYF1muVIhit44DEr3U+9MJkZW4pttbsuAHol2f+YyJJgenW880QqVMzhbSJGjucjX6YanT2b0s2XvEow3U3AAVzgnnqUSm/Da3aq1DXUOTmNphP0EerFQ5oXIjEvM4XTaaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrfZcont; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35452C4CEE7;
	Tue,  8 Apr 2025 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744112498;
	bh=NEnGPEO6W3C829+ENWtu1rBVVodPRfUQmPBIP8EWNEY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IrfZcontpqggc39cNIGISTvGXcjSpPNQyxzKDDrRaJYLUHrh5pNLyqOwKldVrgjG3
	 HLCTqLt2m1G11CLR+Poj5srOqOn349PBGM9tWRwuEMecguYr/3qI86kMJ+5dOgaqzB
	 pbK/4n7tpbPrDnJthIsqKOrHOsZbV3PT3Hh2eT2tcH/5G4JpI7Bh6u4HIj8OEPNm7f
	 FJsp9V1j34b6SwzzRpepOD9KpgAQ5u/zWrj/kk9I5CVuXGerynpyQ/e1OnSY89F98y
	 ZQwIqamUnjE4nARLPzJmJp3Ci31wn8ptZGuL4TptwWvwLep5KVpFJ0yyEA0kVVkmCy
	 Nr9qI0xsczXTw==
Date: Tue, 08 Apr 2025 06:41:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-3-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-3-e6ec30c2c926@oss.qualcomm.com>
Message-Id: <174411249716.1431691.14031212310455675992.robh@kernel.org>
Subject: Re: [PATCH RFC 3/6] dt-bindings: watchdog: Add Qualcomm restart
 reason binding


On Tue, 08 Apr 2025 14:19:53 +0530, Kathiravan Thirumoorthy wrote:
> Add a devicetree binding for the Qualcomm IPQ SOCs restart reason
> information region found in the IMEM, allowing the system to identify
> the cause of a restart.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  .../bindings/watchdog/qcom,restart-reason.yaml     | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.example.dtb: imem@8600000 (qcom,ipq5424-imem): 'restart-reason@7b0' does not match any of the regexes: '^pil-reloc@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-wdt_reset_reason-v1-3-e6ec30c2c926@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


