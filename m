Return-Path: <linux-watchdog+bounces-4918-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGm6Hd8fimnLHQAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4918-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 09 Feb 2026 18:56:47 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFD113491
	for <lists+linux-watchdog@lfdr.de>; Mon, 09 Feb 2026 18:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB361301410F
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Feb 2026 17:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30B93816E3;
	Mon,  9 Feb 2026 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nc8vzvIe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9ABEEB3;
	Mon,  9 Feb 2026 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659803; cv=none; b=oQaWpLlQ5WQDNgY+HXN7nAGI1F6kBnv9EYf3tW7/71P3TyhlJKi4ftF7xkbZFUnk4FSFNOnzVg1weHON2UVl+IohUFkPgiAFrCb4FFzuQ/bcLT49dfM/xlJir5qy7RYkDocThZxSBRcGkrzcbdKChOJ2x2StUSJ5sr25DWbWaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659803; c=relaxed/simple;
	bh=ovPzy4eqQZ4PEXgf3kO3MRbmqI5qmVVvdG2NLMVFDEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDhsG7sRpqDlw6pNYZOUEQLLFfS1p2j/VeZcxkVqq8VqwsN/zx5F0t/KKpZ3kJ1erF4BymS3up+4fKMZAbL2CjEEVW4awtM+SQShar2GU07iJ5JCQcQtv2zSUE0gtwd4td+jWsg97lYvUIhgh74SAyffphqRx0SShf0skhJcYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nc8vzvIe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E19C116C6;
	Mon,  9 Feb 2026 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770659803;
	bh=ovPzy4eqQZ4PEXgf3kO3MRbmqI5qmVVvdG2NLMVFDEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nc8vzvIeUnSZp8Ce6iDR/wiWraHt7Evv6AB13hJHw2i2qmpxUvkUCu1yeTx7U3xGX
	 VGhg0tX+JP34KfHyYnBwJ9QGNO56zitOlrdfMqF7kgbWT6KcEzJjhkwwA4BtiZahDj
	 PMj5VHe2HCIFD4WF3caBJ7GDNgE5LM64WRDpKRnvKxHDa3I2GR/0iRJPgqXIPL2N+W
	 bsrJamARPhFepPsevvYbrAAgnrSqZH6oWRVH0/L62Fe840+91He/eiRC5w/omAKII7
	 dZCpg1k23rrXxdTxl2nIwZR0DR6ZMI4ceeaLUawSwosFEP0W9fK2xMDxlnvCtvyb+O
	 YHj1cZvMrZEQw==
Date: Mon, 9 Feb 2026 11:56:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v6 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Message-ID: <177065980156.1490943.6396266741513826374.robh@kernel.org>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-3-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-3-417ab789cd97@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-4918-lists,linux-watchdog=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E0FFD113491
X-Rspamd-Action: no action


On Fri, 30 Jan 2026 16:14:32 +0530, Kathiravan Thirumoorthy wrote:
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
> Changes in v6:
> 	- Update the 'sram' property to point to the SRAM region
> Changes in v5:
> 	- Rename the property 'qcom,imem' to 'sram'
> Changes in v4:
> 	- New patch
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


