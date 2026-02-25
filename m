Return-Path: <linux-watchdog+bounces-4983-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HedL9TLnmm0XQQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4983-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 11:15:48 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 772641959E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 11:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6588E300829B
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09A938E5C5;
	Wed, 25 Feb 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF2DN8/F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B52C0F7F;
	Wed, 25 Feb 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014413; cv=none; b=LQh/sY1N0K0Xe158Z9YWJJWi9XDKpbtfb643SftorMN3tI3x7QAF0rTtImKTSSdfZBhCANOG03itQhm64bSMNsU3nRtxP5uVjp3VfmrFNV+0PIw8QbkvPq0N4F2HsaCsO0yfW9qRHBz8TEYAVVv6VA9KeYkwGB5Dx2ABriEUJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014413; c=relaxed/simple;
	bh=N5oMDUF0KPyqV7UC1gXRujo3x1PvMQ0Q3FlFjUApeU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am7vb9G4pLbNMMSfLEicxa1wXNxI0i76ThpJSqcNYRN4b5Wh+SCaOAg5IfmWPgdIgfWfhXrrRe6DZ+hibqnPA5CNYyeBl67XQbzUix3vUO8ZmuzagSE54mqNNJG3gChXuI2M1lilb61sw9eDGNHWvANbZQSANaq13fIP1+h6Hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF2DN8/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EFFC116D0;
	Wed, 25 Feb 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014413;
	bh=N5oMDUF0KPyqV7UC1gXRujo3x1PvMQ0Q3FlFjUApeU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YF2DN8/FVTNyAP9jQ6+Rvm8EcGFZMVKZLj1oDfaLLdayiB1e09/sMcyd5ohiNcuiY
	 dOq5vvN/b/y9hjA81h9F0Rd5Gh+krp5ARPMsxhDMb/iMNbVTYRhXjkdmLs1X40iak8
	 pP+qOMrgdDmDHSr3bLRdB8fJySo4td8fmeL580pllE7g2042GW2ei9mf6CoNUY1ttW
	 QmHy47Qei4UUtZ+eGsa9HtFP0j0XUCVRYY/GHLy1E6YTTXzkeEkPoAgDaBVlam7giy
	 3RPijyfdc3tN6fWM8VxInir7prF/BwOTg2zKoiso/RXdaY9JK33Cez0gqahZ8+6vmq
	 W+8Nzn2lmtoYA==
Date: Wed, 25 Feb 2026 11:13:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Message-ID: <20260225-purple-rat-of-blizzard-dafcd6@quoll>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-1-65d5b7e3e1eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-wdt_reset_reason-v7-1-65d5b7e3e1eb@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4983-lists,linux-watchdog=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 772641959E9
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:13:10PM +0530, Kathiravan Thirumoorthy wrote:
> Based on the discussion in the linux-arm-msm list[1], it is not
> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

The reason should be here. I asked that referencing 3rd party resources
is not the same as providing the reason.

Best regards,
Krzysztof


