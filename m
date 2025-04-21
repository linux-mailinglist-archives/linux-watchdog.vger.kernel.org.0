Return-Path: <linux-watchdog+bounces-3330-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB31A9568F
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 21:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B751745BD
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 19:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6523B1EBFFF;
	Mon, 21 Apr 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAx3N4f6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D84690;
	Mon, 21 Apr 2025 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262763; cv=none; b=LTO1lPemeVkNxG3aiOaf+WcFsT2mXoZn76nnKTGLDf0R8t/XIjsurRCasQrp0Qinco29jPf/23jJXVaIxDgiO3Uf9gyNnXmCQ9itrQgBgh5rrTGMogmHEUs3bCGBix+yWmIEkUBDZ6hKZNkkPKjK50HX9spZqf+p8TobXF4/0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262763; c=relaxed/simple;
	bh=Jp9/MbgyD+WYv3nurqRtjn3Bmfwk56xudmIrl7LsNdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbgR1jxlyuz7LMy8k7eQkOXi69Q0zFjeRqD5X3w9EiI83nQROjjgYf/TeYi55jp9mwQYSPWzbBZ+vsfnumn1QG3z9Im9PsPOnnH2yaM8UaLVnHp+89r9x7aRZyERKgm5+GiZqvf5mJnrmsbWv2+sLvBY8y5w7hMu6feT+YpNS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAx3N4f6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F98BC4CEE4;
	Mon, 21 Apr 2025 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745262761;
	bh=Jp9/MbgyD+WYv3nurqRtjn3Bmfwk56xudmIrl7LsNdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAx3N4f6hjmb5KHbvpXwlPx2LW5V04YL/hflyI3p8lF6I7NKDyvX06HzXS7nf5nvC
	 6lHDsaiKwGkF043VC2nQGcQOPfqiIlWPcwhegqc3vKcSc92dvThPGQkU49QMJWh80W
	 HmALNYnz89TLpzTtE5DR7FShcXD45oceo1xoieKPz5kbu9MgjC6D8fPRJFSAeeNn77
	 8EUTtbH0ruGZxwCYjPjwJra29kZSJMuoGtdwoSvI1BBlBHbirUigkCUo8YyOYteBGd
	 5SNQhy6gQldVc3btDxJsNyIuM+IeU8DvjgIzCv5Ww1Y5B7PvHCehOQ0phNDyumLqOp
	 MyO9Sz7y+6MbQ==
Date: Mon, 21 Apr 2025 14:12:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Message-ID: <174526275947.2647870.14926534175640777767.robh@kernel.org>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-1-c65bba312914@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wdt_reset_reason-v2-1-c65bba312914@oss.qualcomm.com>


On Wed, 16 Apr 2025 13:59:18 +0530, Kathiravan Thirumoorthy wrote:
> Add compatible for Qualcomm's IPQ5424 IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> 	- No changes
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


