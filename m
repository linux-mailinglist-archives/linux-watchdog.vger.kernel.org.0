Return-Path: <linux-watchdog+bounces-3655-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A7AD3F1B
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 18:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7A9189FD00
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 16:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ED923C50E;
	Tue, 10 Jun 2025 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWi+CfLE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39223F43C;
	Tue, 10 Jun 2025 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573420; cv=none; b=mG4Z0CJVi+hR2W6TWOo2bxhhSWmkj4c+sZsguTNAGxBoQVEaWCI/DrBE8yPw1rkklVpjOxwfERvMJZlaL0Zajo8mAnjV0Vm9jfukk8dVitEEh2lz573Pdz9WaaGAKCKC/RowuXmYoiDmVxbzYGF1oM/Adq0erV1yVFr9wJ4Kl1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573420; c=relaxed/simple;
	bh=f1HEWtcz6cLIilhmgH3TVGeQxptqphtKL7MZkz99ysQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=O3oEWFQXoFLCqjZGsdWMBbtPFPZWle5vv+hZMhs/B3JR/C6zm8Ik2/xRfIF2WC54phuDbGllgfwYDy81biBaH8YWygv9BEFH9VwR1SFTnrax3LaZzIFS8clDdEk1KgjsF1mVCiNk8HcFZL+QipWhno8Ffoor0S5Ay/JGYUOFBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWi+CfLE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6F4C4CEF0;
	Tue, 10 Jun 2025 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749573420;
	bh=f1HEWtcz6cLIilhmgH3TVGeQxptqphtKL7MZkz99ysQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aWi+CfLEl5K5iNCqoCBYZ5KWDHWKGDC15Uk9VS0+Wggag8I11yDf9Xv39rdFvn560
	 iFrCQjibCbkoA2nVRbKOGBnRBNBhrFqCXtlVEIpxkZbTkD7Hd8jx55wHMOq8gn8rxy
	 w33Ih6YvNOD0TR7VjqO8/tAyRbY3oLmHHScycbMCxq0a0+Elp7CwfbEOJPO2MtjOCi
	 bE35bz0YpPgmaxTHc9XEy/Udj/RZz3T32tjWycw2B5MSFWE3jof5NHfbhbVQw8QgPy
	 BlX2egkHoeLgOuGBHocVv7Pk/ZAHzinGdbhNzomrLS1ktfbzOPoW4JvWZ/xsURYTgv
	 n0J2Fkblo95MA==
Date: Tue, 10 Jun 2025 11:36:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-watchdog@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
Message-Id: <174957341305.1838109.10293724531904351374.robh@kernel.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property


On Tue, 10 Jun 2025 19:15:19 +0530, Kathiravan Thirumoorthy wrote:
> Document the "sram" property for the watchdog device on Qualcomm
> IPQ platforms. Use this property to extract the restart reason from
> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
> entry with this information, when the system reboots due to a watchdog
> timeout.
> 
> Describe this property for the IPQ5424 watchdog device and extend support
> to other targets subsequently.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v5:
> 	- Rename the property 'qcom,imem' to 'sram'
> Changes in v4:
> 	- New patch
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/stericsson,dma40.example.dtb: dma-controller@801c0000 (stericsson,db8500-dma40): sram:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


