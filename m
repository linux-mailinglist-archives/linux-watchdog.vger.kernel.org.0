Return-Path: <linux-watchdog+bounces-1948-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60197A6FF
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Sep 2024 19:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C652832D8
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Sep 2024 17:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9AF15AAB8;
	Mon, 16 Sep 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3Nsn2XC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BFE57D;
	Mon, 16 Sep 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508736; cv=none; b=sYXL/Pv2M5TUZZsHJk1VYOdt/e9va+c0kvAIjmbHgFq/TClbmEIKweXfuTMCK4lwBWDT53K7pVg03726PhMWNvkttfxJ1c+wrKpAZe3Ja4OGqdvSv11fYIzNrWlPLlDJ8s2LHxhtcOCrTLdCeZ0CMhzGdW5+MYffSSAa8bX/4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508736; c=relaxed/simple;
	bh=/J9JVQF2RP/fW7rmcjqsNwCaKwmOgs5LSQ2Zq75zewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7/k+IHO7ALjPUm/CqlpxficBdgGlBuNa3FHl7Y5OgHiJjQgj07r60x7x+Y2+a9tWCQWco/7lkI7IvS+ev30psWXGs1E2aPHsozpc9ZB7nDOjNuF46kwpqprc3sF4r62WQEDUDaeSwj7TfnbtytjzeKSY1DheI8JFo3WhT5qE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3Nsn2XC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A1EC4CEC4;
	Mon, 16 Sep 2024 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508736;
	bh=/J9JVQF2RP/fW7rmcjqsNwCaKwmOgs5LSQ2Zq75zewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3Nsn2XCD/eJEniPEoxHcB4QN3puMzML5nZKhcwgfzamDfvJ9Ur96fuWzf9iTwHfp
	 R8SpjDjxV/8IB4lIPyuFLaL5Ucfn1/tVsEkkaAkLw+XSXTocpkbZTGhqYqxLKk4vtN
	 1tiJhiroDZ+vm+1GTh0gWZ6b8iuzY+OqhgL8XTU4fcW1ET63+3azzrosElTx6oEWff
	 dnux1VRphs6ZJZrhrqU9BrD6o3Poe6XHpNbH0QsURrQCSpQSytDHJ0IptVgtezTDvb
	 cZqE0BE7PwB1fxlnZc1P5lmUcE0mpOZ5yhX4tClaEyh79q88cB1UKB2HbzHzpuwnWy
	 DdsKejH7VM0qg==
Date: Mon, 16 Sep 2024 12:45:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@quicinc.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Document Qualcomm QCS615 watchdog
Message-ID: <172650872929.865205.1913224631021020834.robh@kernel.org>
References: <20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com>


On Thu, 12 Sep 2024 10:56:59 +0800, Lijuan Gao wrote:
> Add devicetree binding for watchdog present on Qualcomm QCS615 SoC.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Add devicetree binding for watchdog present on Qualcomm
> QCS615 SoC.
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


