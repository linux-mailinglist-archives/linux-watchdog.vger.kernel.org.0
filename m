Return-Path: <linux-watchdog+bounces-4996-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LXeAodIoWnLrwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4996-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:32:23 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC621B3EDB
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85623307B7D8
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A0B346783;
	Fri, 27 Feb 2026 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWrQ6qaD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF183290AC;
	Fri, 27 Feb 2026 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177413; cv=none; b=Yhs/xCkKfdWdWo7z4N6J2Z1656R29MIZgU8KPhb+MaXVpu3agBBArpY/0MO9W9S8XtnIkPrV5vAc3E17TM01ELGnvR6gvQYrQjOT4qEeWYLjJ+Et37/j3AmYOQQ0fIURBJL8px03nf8jhPM96DMHPv509tWR6VZJcwQfQ4+/o7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177413; c=relaxed/simple;
	bh=WbseMljo/rkQ1e2rnUj2iSBuJ+yjrP6vtPmOk7gk+WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7wb8ijgeSPp7cRR8u5rT6uLLRiK75REoTEoSTgtUG+6uMbFqbBaE8aOjcRcsQgANt3AgkwnhcO3KaAvt400kAsSRL0N8TikIaCrM8oWQ0djLFwR3UWDUkrrRcTlmTH2ed3G4l6cbgdUCMqQJihWZTHI3/tatyKiQPQ3XjbQ67E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWrQ6qaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C39C116C6;
	Fri, 27 Feb 2026 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772177413;
	bh=WbseMljo/rkQ1e2rnUj2iSBuJ+yjrP6vtPmOk7gk+WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWrQ6qaD5MIguuYtoFb1yYNSpBnJAu1efNHeVZ5lLmAOvMmb4DEFOTmJg2nIkC4f0
	 kToVgZZPfwBB0nGDGs4wMswg4XJnokNSWOZIVld51cZKfLBj1Sd1zwxCzcG2NGm6qz
	 ZCOFyJ3mamI0OwHBN5oa8vNlhNf0q599Z/tOQKHj0WNR8UMzbpdywftApTfMQj6Vhj
	 sLagUgQbItP8v/B3TRQg0fCJQn50Ov2lbD1kN8pQ3xLonNwzpGbDlqAz1PTqjw9zLk
	 wgqGyPW2lyN3J5o4wDgViEkivkKVSsadU8fN2uRQHzItXey0pmLAG7+cHnPhZ+ekYa
	 n/Tdqil2z/iHA==
Date: Fri, 27 Feb 2026 08:30:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Message-ID: <20260227-sexy-aquamarine-agama-0d2feb@quoll>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-1-011c3a8cb6ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260226-wdt_reset_reason-v8-1-011c3a8cb6ff@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4996-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6EC621B3EDB
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:29:36PM +0530, Kathiravan Thirumoorthy wrote:
> IMEM shouldn=E2=80=99t be treated as a syscon or simple-mfd because it=E2=
=80=99s really
> just on=E2=80=91chip SRAM, not a block of control registers or a device w=
ith
> multiple hardware functions.
>=20
> Describing it as generic mmio=E2=80=91sram keeps the model simple and clo=
ser to
> what the hardware actually is.
>=20
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualc=
omm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


