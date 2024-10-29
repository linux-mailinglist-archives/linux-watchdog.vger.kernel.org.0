Return-Path: <linux-watchdog+bounces-2373-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDE19B435A
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 08:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA521C21B02
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 07:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF5F202657;
	Tue, 29 Oct 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfrhLZTP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F61201111;
	Tue, 29 Oct 2024 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187752; cv=none; b=bh5UKnVbMVVWRXumC7q3pHwt0xz9A8dbthZdfkvfm1gxlRvjYag3YY47IfcATyVzmK11pbk24xRJbNLPIZyi+GWINrQNatXFWJd/WNkT8/9t31cPngR1NzI3v26HiXxyptFS3GCtncOO2WfOZ97rCHjSKe320+D3NG9Es4oYT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187752; c=relaxed/simple;
	bh=liBtFeMwtP64ocYIQSXe0Z2jastcoh23QSMUm8LtdDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eoNcCH04SnUM5gpwSLNoY5Ufbon3sZ3pD6+PjjkWHm4AI5wLlBXtAClH/MPlk/8xsAoM3BekQl/wBgqV+PcjYAx/dqE+MKRNSTUUca0jMBdJHMjwUoVdAUAuxfWIRsbDzssIU/z9TykAMPn1UoCMXThcav/5Ijsw6d5NW56caNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfrhLZTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEECC4CECD;
	Tue, 29 Oct 2024 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187752;
	bh=liBtFeMwtP64ocYIQSXe0Z2jastcoh23QSMUm8LtdDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PfrhLZTP58+0iqvDVfNlo2LDZc60cbMYaZnn4aUpXvXVZtpwAxLqw2bMAnINyQEP8
	 knmStMgbPQpbCQarKCzzCvmvNFVTAdGzanhA/ib5HXxPk1gSZOdvy0jJeEqmuhpwZI
	 JOL0hjRrPK/WxeYeUCzLOWFqvBWsPoYVKghVk+hrC8J2+5p1da/fOYKM25wYdYXxPm
	 PO8vh6xe2g3qH8ZOEabKTB0sES5g8/eOMZ2XgU6TwQTeTu08tw8wgz6vDi5OH5pjuU
	 CZ5d1bMJbZ/UCUbBWRsQI/orvFDlZxn0F/MDPaJUBorpjnn6EpEXY/QzZTI4nEpeYO
	 UB7PtmBImRpMw==
Date: Tue, 29 Oct 2024 08:42:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com, 
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com
Subject: Re: [PATCH v1 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300
Message-ID: <lda7722a6nock6qs7femz63eiiwq4ww3p7p3k5plvqsgihvutv@viktvfs66mzx>
References: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
 <20241029031222.1653123-2-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029031222.1653123-2-quic_liuxin@quicinc.com>

On Tue, Oct 29, 2024 at 11:12:20AM +0800, Xin Liu wrote:
> Add devicetree binding for watchdog present on Qualcomm
> QCS8300 SoC.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


