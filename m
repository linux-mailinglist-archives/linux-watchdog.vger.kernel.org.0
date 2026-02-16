Return-Path: <linux-watchdog+bounces-4949-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XQoJMf5bk2ny3wEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4949-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 19:03:42 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54472146D91
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 19:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949EC301F320
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 18:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8037C17A2F6;
	Mon, 16 Feb 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDduNgEO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AB3C2D;
	Mon, 16 Feb 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265018; cv=none; b=XJeS8EaB5x7y1/BkW+f5QQYhPvGY1BiVuSDGUWAqWgSv7ubR/QO8Ie8SQsEbELG0G0BxvDTBS5aqrnlcVUVZI6BY4n3s0pHj/dlCaELVKRjTT7VKSUqTSN6QebirtUc+Vq1GtB9HrfWU4mdx5+7hCl+Awd3PzGweAgzI3wv9ZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265018; c=relaxed/simple;
	bh=12AobuvfJC0/Rr3kiMzktENzoZVeN1x1pS64b07jWBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sk6Ny5I0CDcR0rw5P/xBis11gnT4HW9WET03L+MGrKOKWCrtl2aRUAiT8wBK9KVcAcWgISTWszh92Jm+0RYtUTwKvj83JwFvksiqOtTkQuc1PEW1on/0WqB+JTia/RYX2rRHIdkBYxbSgo9+sZ6lYSK/l5QEDDy/z7ogFeht4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDduNgEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C3AC116C6;
	Mon, 16 Feb 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771265017;
	bh=12AobuvfJC0/Rr3kiMzktENzoZVeN1x1pS64b07jWBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDduNgEOcqajMkaro+wm6lM84ZiDLoeR3Vbzlbe+KK03k2fqCPjOe4giRn7+UeXZu
	 BAsF2nw1KPHivF+8b3EhqXSraau6Vi5DwRcBik5uDmvklN/DPYXIlC1XKtKYUMHKAD
	 c+bISUM8EiIwjtXVCZDvURseuxeiscpq77i80dhKUvj8k5viIJmLsm4wWgp4vXy2Cd
	 BwFxwu9h++MVvlw99tfHzlfXht/sLShN7Znj0Y27vvhM1CpUMeATAUFq0uSI3tSewO
	 k3LxBduIeJQQ0D5R/4v3mxxs8/72oxil35egyvvvHuT85KdKrjWOn6Dj3/p97AFDLp
	 9GczmUS2sdFEg==
Date: Mon, 16 Feb 2026 19:03:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, 
	tali.perry1@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status
 support
Message-ID: <20260216-prompt-boisterous-worm-fed8d9@quoll>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-2-tmaimon77@gmail.com>
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
 <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
 <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
 <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
 <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4949-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54472146D91
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer Maimon wrote:
> On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>>>> +  syscon:
> > >>>>
> > >>>> First iteration. See "How to Get Your DT Schema Bindings Accepted =
in
> > >>>> Less Than 10 Iterations"
> > >>>>
> > >>> Thanks, it was very helpful.
> > >>> the syscon property is already found in the WD node
> > >>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
> > >>
> > >> How is that file related to this binding?
> > >>
> > >> Either you document existing ABI or you add new (for new device). Co=
mmit
> > >> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
> > >> discouraged) ABI was already used then it depends how and when it got
> > >> into the kernel, e.g. if someone bypassed DT completely just to get =
it
> > >> inside.
> > >>
> > > The syscon property is already used in the upstream NPCM8xx DTSI watc=
hdog
> > > node, so I will document it as existing ABI and mark it deprecated. I
> > will
> >
> > And how it is used? I cannot find its usage, so I do not agree on
> > documenting it. Property should be removed or at least provide the
> > justification/impact of removal, if you need it to stay.
> >
> > Understood. The syscon phandle is used by the watchdog driver to read a=
nd

You messed up quotes.

Can you point me to the line? I REALLY want to be sure that we are not
wasting each other time, e.g. me looking at wrong code or you telling me
some bollocks from downstream.

> clear the GCR reset=E2=80=91status registers and then report the reset ca=
use
> through the watchdog bootstatus bits.
> Therefore, this property should appear in the binding only because the
> watchdog driver actually uses it =E2=80=94 which I am implementing in thi=
s patch
> set.
> I will document it accordingly, and also add the new nuvoton,sysgcr phand=
le
> as the preferred name.

Best regards,
Krzysztof


