Return-Path: <linux-watchdog+bounces-4846-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBv+BE0wemlq3wEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4846-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 16:50:37 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA6A489A
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 16:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 876DA3071C7A
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 15:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9115F309EEC;
	Wed, 28 Jan 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJV7hfEC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEE236E492
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615166; cv=none; b=ElanMO2+/9oNUk+EQmGvCQqa5RzyRzDdotsA+b6Qsg9UfwJzGXRjWAUUf985371HWlZFwSVlMLZDTMNDusiwhp1u9UgJS05R8BjLrQBYh6Sog6C+gjCoZS6bI8h0dOH6yB+UCCDxvUkTGcIdUqccmBCMTK7yCkbC08BVDLjzlsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615166; c=relaxed/simple;
	bh=g3AmRlixMLTqZ4wrS0BdriBjfy97yfemg4iwfDm4TEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoNbXyinclGbFf8k4t+NG8tiQnzx6iDL9hZuRvTJWgleDHJ0qe3i5h/FS8wKiReEX3figvKRmeyAerjEBQ3JIIDdLpgkmrc7HUS14px0CwwA6xS4J/dMhtpAo4pDGp3U1xnA8FKltHCiHZw4Lnm/BKV1abo1Av+Rdbj/R5YUgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJV7hfEC; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-503347e8715so16794281cf.2
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615164; x=1770219964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WADkY52xhFpIWsbKCOqSG612AamsVwThqARVdW6UaNc=;
        b=WJV7hfECdBdvH/28ZBYau2Nh8Pcx8JKdWK0eIdVVPwD/pGo5H2gPzPJTXJQhyDni7y
         R+fv0zICnlimtJMQAwhBH8bGoUVmOUSfxXp2+gEped94L/f8J4BFWEbPF0ZDmS3HoTWy
         2YE/wMQm3eZsrFOUzeEiy5undINI2QAIWu8e0ezXvHKIBQopkmTm+DiEwe96xHpk0027
         dw2GJD3ZGe7tO+7a8ZYrioZ0YJ7rjFCb/4ysoYai45jbeQpaxL1BPqGWUiE9wgOfbGoR
         6mfbxMyr/HU6iXdVGI3PYVrLV4ThbZxHk3nwZVuwCxQ1nuclZolYbL3fFQmvNzv6S4P8
         fhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615164; x=1770219964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WADkY52xhFpIWsbKCOqSG612AamsVwThqARVdW6UaNc=;
        b=Q/dySqoyygQhA+v+UHEA7Hb+j9NVP+fGKlULOJKRbnvy4NJ2MwJCGjys/FlX6+v/WW
         zJrjDEB+rmFyhD4Tv6awRdZgta3tx+L7sw8LhpikrIApfx933od72XJPaHcNBi4uQ5LH
         RcrvdDPlCVwQf4nPwCr/YKV8GfQVwGygMVo9Cr4tKpP0IvXxmPoMsT8bUaYaLNInttEP
         vqz/aBX0fOM944ihe/vSLDzq510h86M+PxMheR7a9SWnu9DyGcIh947OKmuEATBo6gFn
         2TwHuBYAL4YCF6pUCfHIVprKwhVal2Y8yJeGe1HgA1+LEaR31LiWKPtTg6JhyCy1qUkZ
         2WNg==
X-Forwarded-Encrypted: i=1; AJvYcCUtppxPgYbwlDwsALelUGLSjFAWCantlzhFGrsZ7L7bcGOWg7ia4i58LJU2QX+RHSZBXYdnFhBmcfiqgttoGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+tc1yScz7QXPrWR3IU+fYUbnSCls1MMY9lb0G+jiNzMF0eoG
	BZpnYwvQun7yGDi3RGs+lIFwqGQG+9iUXqZyqo1A2kPf4LCjxj8ZUmq4IdDviio8
X-Gm-Gg: AZuq6aI9o8HAVxquQ2uJ9KPzIGU+WGoXTHXdNKahEjWgeBl8Y3//D4+KV62Tgc7IHPB
	Sud4Yh20usCgJRivSxXlDsChoOPOHlkp1Jl4V+UdY992tgZYahBvTMYLxq6b33i5K3ZVNMmC+3M
	ypedrrdxuq1rYTlxt/E8Djo4H9xD/yzbr2fiyGqpAlh85zitmbscQdVb+JoXWKef9+JEu2d3j7M
	VAqmOlGgK4IIhF1Wowyl9yiUdhjtfr8scSB4z4/6aB8Z8aTlxISoOg/wiRoEiOq7Knrb0XOfX5K
	ZHGgr0AKw+kgndloVduRnlw5PD+zLiITsqSWaMiPryBy3AkUeaS038IUksMS6jZkFVjQKzCWF28
	hJX6Iy2Gs0jOIIsdnQLWOlA9uQHYAjx+8fH0zcQF7HIU9k2m1rJ7Q0ft/MxbLW3d0/NZ5oNzIPv
	zgmJU=
X-Received: by 2002:a05:7022:672a:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-124a005f62bmr2788054c88.6.1769608316122;
        Wed, 28 Jan 2026 05:51:56 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a14bb02csm2614616eec.0.2026.01.28.05.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:51:55 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: dianders@chromium.org
Cc: akpm@linux-foundation.org,
	lihuafei1@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	mingo@kernel.org,
	mm-commits@vger.kernel.org,
	realwujing@gmail.com,
	song@kernel.org,
	sunshx@chinatelecom.cn,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	yangyicong@hisilicon.com,
	yuanql9@chinatelecom.cn,
	zhangjn11@chinatelecom.cn
Subject: Re: [PATCH v6] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 08:51:40 -0500
Message-ID: <20260128135143.1777381-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
References: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4846-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,huawei.com,vger.kernel.org,kernel.org,gmail.com,chinatelecom.cn,linux.dev,hisilicon.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chinatelecom.cn:email]
X-Rspamd-Queue-Id: 77AA6A489A
X-Rspamd-Action: no action

Hi Doug,

Just a quick follow-up to my previous reply. I've just sent out v8 which 
addresses the Signed-off-by issues and some final cleanups.

On Tue, Jan 27, 2026 at 8:08 PM Doug Anderson <dianders@chromium.org> wrote:
>
> One last note is that your Signed-off-by tags don't match. When I
> apply your patch, I see:
>
> Author:     Qiliang Yuan <realwujing@gmail.com>
>
> ...but your Signed-off-by is your "@chinatelecom.cn" address. That's
> generally not okay. You need to do something to make those match.

Regarding the Signed-off-by tags, I've included both in v8:
- Signed-off-by: Qiliang Yuan <realwujing@gmail.com> (Personal email)
- Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn> (Work email)

My work email often has trouble receiving external mailing list replies, 
so I've included both to ensure I don't miss any feedback and to 
properly attribute the work. The v8 version should have everything 
matching correctly now.

v8 Link: https://lore.kernel.org/all/20260128115358.1757147-1-realwujing@gmail.com/

Thanks!

Best regards,
Qiliang

