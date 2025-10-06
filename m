Return-Path: <linux-watchdog+bounces-4335-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3BBBFA0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 23:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3783A6DE0
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 21:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BC226657D;
	Mon,  6 Oct 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTyoIor0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3738DD8;
	Mon,  6 Oct 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787865; cv=none; b=kLcSo/E0h3P2ACjauDNVSPS7xQgK2EUzEqhURxdwAh1mqpyaD3A3rCPqK65tSE7yQ1+AbCJkNokeK+cHugKoYOCA5g3wLsxbjAZecYV2Sj2PTuIRaxM0EnCTcnJXyk5FOyOiBLXdF9r80jdMPR+Uh6z97C7OKHvy6Jagj8nqLfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787865; c=relaxed/simple;
	bh=yp9tR/3bMmlgJmoJe+O7mORmnlg42QVaBRKpSQK+faw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezTsr2XCPOb/SO4cFXMMdAs19uS0AKNVVN6x1HHcJUYAuGcK+hd99V774oxbxgJPzSFN9QE0CBc43K6f4do2hxDQ3yJN4I7YNk8E+e/PlCvgDE3Vp995ovS7sqfVPWr59rj2l2kKszQ3nCzNgeUMYHVynkk7MKgS4HZPPPzmkPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTyoIor0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C8EC4CEF5;
	Mon,  6 Oct 2025 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787865;
	bh=yp9tR/3bMmlgJmoJe+O7mORmnlg42QVaBRKpSQK+faw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTyoIor0/sVEIADuKwC2wgz0koY/pk6wANm9phf3dA/bKr5hBzcYwHqszSKqpPCX2
	 cA4l0i8FyBxnWUi31SE26Qw22ZzmmwFflHH2APVfOv7uEGxUzoAmxxZncclZhC2yvi
	 zF/0Ffbfq2BJEHjUvUzaIOkIKVrB9F2cUszSPmI1sgfzD/jR6Y9GOzdRwE79/xP51m
	 el9HfnvxsvKbZSGHiuOhx7KhB0kEObs9wrwscFDOkh64eaEo0Aw3D+2A6LuPhsHOKx
	 mMdvE1E+KkI/JjaVQC9qQuGuxTHSsxNmxY8GR3GYFgPIfoNwRj9Z7UMdnqHPFtvQPP
	 7xor4IFATWACQ==
Date: Mon, 6 Oct 2025 16:57:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: watchdog: airoha: Add support for
 Airoha AN7583 SoC
Message-ID: <175978786337.652658.2471025622526650707.robh@kernel.org>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
 <20250929114917.5501-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-3-ansuelsmth@gmail.com>


On Mon, 29 Sep 2025 13:49:13 +0200, Christian Marangi wrote:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


