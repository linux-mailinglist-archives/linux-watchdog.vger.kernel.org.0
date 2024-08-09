Return-Path: <linux-watchdog+bounces-1472-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7194C8C1
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 05:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 639302873B7
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 03:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9EE2FB2;
	Fri,  9 Aug 2024 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zz52NXAP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29016BE4A
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Aug 2024 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723173321; cv=none; b=QDXxURo/b863NdUp8cl/7URkHuIUQrKE3A1IDYT2nqWQEsYlaVk3rSimKFj5A1Ysyu6K6LAuwcH2hPL+v/TQPGLM/ZkLxhugk4cgoPHLVAS9RaES6S2L9BMg+Lj/Lh0hSLXKZ/O7Idzz+5hw9L26FNAw0aOMuuRtZXVVOZaEybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723173321; c=relaxed/simple;
	bh=0U1h610ibxoTeB8XOdllfQTS3g40qHyobdG42X7Q4SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZjqIFiOSDu5TVnWdjGX9I6mxc3F7Ab5IRGqG0E0FYYwzWACLBMrWmQ+x4k2kfoty8sa1xpdjq2RMCu87D22xCGuO5z0Uw26QJbpU22RxvwJMxnz+9IMtS8OvnH8RuksEYMVfRWV/V3HZG4XwIoIX9zVvgWFLIVyP1WFRMbrLgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zz52NXAP; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso1228198a12.2
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Aug 2024 20:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723173319; x=1723778119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6HTjUZ8/LcZQPS4E1E7LmQIsZumIhDvbfpjZD7fonE=;
        b=Zz52NXAPxvsMYYfrrQa6rdFh1h6rplOG9NNuU4+4BCi7cKWUrEy4MPFBo43d9QR8dS
         uors7hRDjCyWbV27t6+7tca/brlg9IGZ9axDrSg8g8Q51YU10m6NEf2FN2Grn9MExQIi
         0VF8qNcsI7Qrs3QQCPzvHMgrbLeGGW0idr8eMg7Mb/B5riFlhlkIUxnaNvCoEJ84xdv2
         wVESIxBcpmu0wzm/qMo/od3s7M5xVsGSfSRC8ZxfR16HqNqkh7OqmOClqAzPOgpqIqIb
         N/fKr3rarvW1bRDJH24dfUthJ0gyQoayT924KMdIj6gqnnA6y20gs6bQZD3XiR792+mF
         R6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723173319; x=1723778119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6HTjUZ8/LcZQPS4E1E7LmQIsZumIhDvbfpjZD7fonE=;
        b=EpbWQFasqkHPyUYkGiQv7LofxYjBxLNVzD6oi5ibijZ9FdqAPzJnCsYQ+Ycl0dcpaM
         4eosC0Ppeq9986k+toGjZoGh03Fn+GgI+6PEa629FaBZNDG+pVtN/wqiupfRB2y1tlKX
         iLqatAyfIYc0DX2H72pW3DAILhtqA72xDdrQyuhelt7aOPmf+oOqpaiEGURr4zQi3HlQ
         uqfH9XvPevDmmt5ss/DIceidn/kAkqPf2oFdbRMJlLpxoIYUuD5Ya5vyaB4YO1m1tJL+
         GfRlGteUkiIKUh2nSjcpWnf4KmzeUdAw7lOVoS0f5mguFlYEpGIu19Mn7d7fWdd0nijI
         7SBw==
X-Forwarded-Encrypted: i=1; AJvYcCX5H+cGq/+JqbyPdHeC5Ypo5SUfXVwTw49mwdTiDziI3PtJVrR4R7rNVDYPDsv8teh893UC0tDqPWCysEutAIaXfkhW8RsVbwA8ONP2Dyk=
X-Gm-Message-State: AOJu0Yx++luUY9R5nWbvO3U0RHnyZ94xIL/+h9qfskR+rda6LUsKNMYx
	gRW7JPIE/9xROpgrnLGlDo/b76h17mo80Zv43QjRmnaiYHh45ROd
X-Google-Smtp-Source: AGHT+IHxDHrTf7UIA05QLCfl05wqk6Qk8+9N5VreoLRJ2I4pByDrR3e4gAPjwCbmh74hU07IOFUNvg==
X-Received: by 2002:a17:90a:f2d8:b0:2cb:4f14:2a70 with SMTP id 98e67ed59e1d1-2d1e804a9a5mr130964a91.30.1723173319136;
        Thu, 08 Aug 2024 20:15:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c7b479sm1894110a91.12.2024.08.08.20.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 20:15:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 8 Aug 2024 20:15:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] watchdog: imx_sc_wdt: Remove __maybe_unused notations
Message-ID: <91ec5aca-0b22-4130-adbc-fc0af107a6f9@roeck-us.net>
References: <20240809020822.335682-1-festevam@gmail.com>
 <20240809020822.335682-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809020822.335682-2-festevam@gmail.com>

On Thu, Aug 08, 2024 at 11:08:22PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
>     
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use __maybe_unused notation.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

