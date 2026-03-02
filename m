Return-Path: <linux-watchdog+bounces-5044-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MnmM/LvpWlLHwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5044-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 21:15:46 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD31DF362
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 21:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14AC430038F3
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 20:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E0630DD1B;
	Mon,  2 Mar 2026 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrmI5Tkf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD460383C93
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Mar 2026 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482397; cv=none; b=f2rvF767eInByDE+/KwZ5HM88Jt5qtPfDi9YFi7lC4ClfAkDT+i/Pd30/ts9/X7fvkLgfoFTYzHMz3C8e8VnZkgACjciKkb3zq+DSd/yQhMlzlQQoJuF0P1VK6hBuO+MxeC/+Q9h2p+fLqVpOPx62ISSHathVrNg5YVAhMeryJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482397; c=relaxed/simple;
	bh=wmK6HZsm82N5mHeQ21VY1I1Xe4t5dM4RRH8IkdE/I4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTchGAxuy+pc/qksyAde6RhPO8i+MDox6SkeuIVJGp4wRq6rKNC6iEnOS/SN8JiispUkPi2esNLrzSsXReINQtKbbaKhD5A8KlhrOUO6iSWRzeBYtQU5NvSrLFf+9Ua+9K9HR97xTggqNAH2tNdQXHGQLbMHpNXMkEO3eJikOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrmI5Tkf; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12758ce1e8dso6299075c88.0
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Mar 2026 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772482396; x=1773087196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1X4gJkwyUg1gOs6Pr7zwAYXH4kUMTQbImGf+aQ1BHI=;
        b=WrmI5TkfXJL/Irf1cnafdFZXJwoaVhF5htxWr+oCIBJg570kZPbw7nssjZ+PKrQpzc
         PBsSykeZ6W0rr7FRLLr3LZN2d4kX+5SLJwfGSCVj9zaKh9mrPsdEk2ovgKBuOdpbJTRZ
         XqtOA13V/fQvvQd3xLxvSxbvON4yttx+skGGYZhGUCEXlLoHqezJHidhDWh43shLgoTF
         n3VkRq+PZZgsV1pYHDqwawvwcJE7YL6gRSWnTCiJT4U0m7vphw9Pwh1KfwIVBFlk3TAa
         nle8XyqQNzqwk6ts2HqXPXyjwXYjIbfkXSczcwwGdqOzr2H1wLQaeoKJ5VmZug0L7oqZ
         DM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772482396; x=1773087196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1X4gJkwyUg1gOs6Pr7zwAYXH4kUMTQbImGf+aQ1BHI=;
        b=WpN3IopZp0rgXXCPHZzBk0gqqJ0jYQE/Yn7eci9Oj9Y6zDATByvQamWn1nnK6s3m5V
         z9egER1p+XttZhH9csYriLxw0FSXNibly2ZQL3sZcSBwESC99+Hb3HhKZBGgSfKKwzeV
         y0qLXbNrWBv3idCdrsebn/8+33e0qcOP2CPR3DQ6FRJ+ldQT1Nj537mm0eLZiwN6cULh
         ZJ9qbz9UeXnpwzr6HHNfisn4XV3Li5dmOPNLI0u/QBKc4mJMqj4hO9j0hzkfOXugshTT
         nzTiukbytx2m+Z5Wx4z0IqNPoUgSgOzO+1glGPrhTNdHUAEwPq8vR9r7mLUCRg9wpJ1C
         znWQ==
X-Gm-Message-State: AOJu0YyHcLGsWIHzY9P+QxOqXVn6dcZRu0lj8OIC2lmWJK38ACp+mHC2
	M1acPMsxXs3ndEkGHiiZBmw8KUGQAxicS4UnguUi26kjpZkuD5/N1gZj
X-Gm-Gg: ATEYQzzOQqf9Na82VOZrENwE/ln39bXt3D4xV8PDQn3TXae177IiaJPLVXSjmNNPq2C
	O/H94MaT+JtBbmjYiQvD1GeF5jyzQkDtt3Un+K0okuB1Bv8P0z4GboNqQfOWCZ/E0p902jar9bS
	PgfV/aAwtZHdTuT/wQWLGmsDUDWidCQ2TzcPa4d+LbFlTAU1wh02Sfi21CjznVsob7HRYqURga6
	QfpvCYbfEFcBf/lpcNG7me64AjoHZqR2g8oGv0f1pfhZbJnc0Iwlqdj+t+8PVuP11Dk6SUPS1bg
	evPzBtvhRPG3Wic+YDQ0cM7W3m+ngr1GRpf88dojp8WnoMzRuTLPeFY7ymkBBVjBWuQihhPMz6j
	bBYZbdmZo7a4FY62PBEEHE1srzNUH4AHxmy/5Glk50VhfGFf/cjRE4xm5k11LK9YabFT25xwZSI
	P1wbcDrX7xOjGoRlsnEGEAnMs9eM4HI2h319TL3Pfe4f3CYM7CAg==
X-Received: by 2002:a05:7022:128f:b0:123:3bc6:1ffe with SMTP id a92af1059eb24-1278fccbe64mr5198425c88.15.1772482395640;
        Mon, 02 Mar 2026 12:13:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm6108046c88.2.2026.03.02.12.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:13:14 -0800 (PST)
Message-ID: <1f69a0c7-7e8b-4886-b269-87e754294a08@gmail.com>
Date: Mon, 2 Mar 2026 12:13:13 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-watchdog@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260302180853.224112-1-afd@ti.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260302180853.224112-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 34BD31DF362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5044-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ffainelli@gmail.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,broadcom.com:email,ti.com:email]
X-Rspamd-Action: no action

On 3/2/26 10:08, Andrew Davis wrote:
> Kernel now supports chained power-off handlers. Use
> devm_register_sys_off_handler() that registers a power-off handler. Legacy
> pm_power_off() will be removed once all drivers and archs are converted to
> the new sys-off API.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

