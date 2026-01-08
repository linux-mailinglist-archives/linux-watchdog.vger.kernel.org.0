Return-Path: <linux-watchdog+bounces-4774-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3416D0475A
	for <lists+linux-watchdog@lfdr.de>; Thu, 08 Jan 2026 17:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C19DA3030228
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jan 2026 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC64027B358;
	Thu,  8 Jan 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxGo0Lie"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B7265CA6
	for <linux-watchdog@vger.kernel.org>; Thu,  8 Jan 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889136; cv=none; b=cmpmuKm0nVkf9KtUygxKZq6xwtWHe5bpDuhMzVuMjeUwEVtKbnbeJ1RNmmTVeBxJbPR8GSQp+5+F50rPvdnw5felOIvSSw9p6hqW8PrRqpLkt3jeWuyO5EXKswADI1YgxlN/evOjBBO2qiG3EAgS0N/2Ob2O9+o1uewnYT75ihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889136; c=relaxed/simple;
	bh=O6+oFR1NOZM7poQ7ME6Vz9XmsRTpUcTt9KHN7yAq0oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8bcE0mpT9zvR7e6YOD7IintJToUHUpayTklOyJwF4vdMfoBjnzzdZ5UiI52svGfueDDT9q3hx7zVjPmo+k58+fobFAoCcESogh1WU58HEcoywcPNVM9zSKUoFR7Tnw76l7BMCFj/RvLW9lvAo3cdB90bX0ykujIMHesaFH8ibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxGo0Lie; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-121a0bcd376so1051184c88.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Jan 2026 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767889133; x=1768493933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqeESqwjwwB7zBaaddbtVMJBEkf6U2caroyFqB5VHwc=;
        b=PxGo0Lie4xRuEFRePuO2Iss/BjDYLp88gVZwyKsH8bve9VgXeQyLAgOcGgDK1RfRVC
         KUbdJoTTE7EQuM/zdOYUKT4JL1BtKJcl5Q1ISqWshnXP3Fyb9SR/LSA78IkDizjVHpLo
         bP8iZIuJUlNv4uL1LaD4OkpNtUqUokza3KYpBgQ1tCa9CyDfg//G4Fo7lTvKjTt/ASxz
         2hj5/o3RXfVpRj4RAoS7kCotEzWFsTGIe5/B+zoU4F40wJGw9GlaGOJy5pDomfg+xzBk
         UOttspZHoSv1fu91BUm5jiso0DM8P6LJUrnSFXg78DnZMe95is+flQX/scO7PdzT6Gey
         VKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889133; x=1768493933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqeESqwjwwB7zBaaddbtVMJBEkf6U2caroyFqB5VHwc=;
        b=XJcWfQAVakN6Zvf9m0YzW0RgV5y8mzhlypWR6SgYftRr7LbHXC+/duX3pZfzYNjqjh
         a8g+YBXUvWrOs3ulaTVVUZAIAOUMg2rNMRNbhBr47WHywSsqVQiy9QnHArQCw07ToEo7
         J722gVLvTYhivxOYimDSkkLD5R7nAUcf6BaH6YJwvoXV0O/aQsFSB/23kFq7ZDJkAIkM
         Z3XOSXSKY3MLP8O0xPqsjTcebQRqaxLWpQWKo484+D3ipeYnsC/DsibwqT6+oBqK8eV2
         UxZt7y1ye6MMUABc4zV9MrnGFPFGqRFzmobKp0hDzfH0L/CszJu5vE87sbrM/cukE+jE
         QMxw==
X-Gm-Message-State: AOJu0YyR0ADaWf5UUQQi+aVOsBvg/e3ITtNfuXhCjuA+mKwhY60xBXZn
	9Wg5BHuoNbbzwdeWDoO8nS/TQ5HW91W5n//2L30eEBp2Y2zzDpX79P5WCEYfrg==
X-Gm-Gg: AY/fxX4RElXdZOWJSM0oE2C2pttg1KOaQyFFF+Cy6Bp71YT7DT72kcQH772O4sZpAnY
	KqA55fhgTAwSmxGBxmr28fnG6IhevVRDu/nh1FMie2tH+ao7M6ZWY9Fb1aj0d7kyCK2t8lOa8MD
	G7lq8ZxsVoHIoFIKern2i02HpWE2erJvA6wIbNn0fazvB4AtTbL6hJAIVNnETN3Tvr1uF69TP/E
	Iw/bM9FTa0NHPl7SENItcxMwxt+x/0W/XVbn5aWlPUX8no2WxbIJAdzV2ylK/2Kza4BnkSpsk1j
	9Ymdc8OyU3pw8YLb3dEFxcnc0nj5ZsmTxtR9x4KEejySu2QlhPA0jz8nFinyrLZw4mlzrkhgmTa
	Npqt2TXsBxRirtkMC7vMKrhU2KaAkrrhROgWHdKZzjQ7Tmx9de07OwtJrv5PKJvdXTjZ9uu3vqB
	gA8httSAFNAw9CeiPpYP+hNt9G
X-Google-Smtp-Source: AGHT+IGzcV+omYF0waHLEIqPsGu7/NkvQUX1f36pXfP6t3kdKvRuPy/O8uMVloP0kxR5YWmqnrF+aA==
X-Received: by 2002:a05:7022:622:b0:11b:869f:742a with SMTP id a92af1059eb24-121f8ab92f7mr6120725c88.1.1767889132469;
        Thu, 08 Jan 2026 08:18:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243f384sm14051575c88.6.2026.01.08.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:18:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 8 Jan 2026 08:18:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?546L5b+X?= <23009200614@stu.xidian.edu.cn>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] Kernel panic in pcipcwd_get_status due to simulated
 overheat
Message-ID: <4be6759d-091f-428c-a514-fec465cf053e@roeck-us.net>
References: <409c49ef.ab91.19b9b835c62.Coremail.23009200614@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <409c49ef.ab91.19b9b835c62.Coremail.23009200614@stu.xidian.edu.cn>

On Thu, Jan 08, 2026 at 10:50:35AM +0800, 王志 wrote:
> syzbot has found the following issue on:
> 
> HEAD commit:    6.18.0 (custom build)
> git tree:       linux-stable
> console output: (see below)
> kernel config:  (attached)
> 
> ---
> 
> pcwd_pci: Card timer not enabled
> pcwd_pci: Unexpected close, not stopping watchdog!
> pcwd_pci: Card timer not enabled
> pcwd_pci: Unexpected close, not stopping watchdog!
> pcwd_pci: Card timer not enabled
> Kernel panic - not syncing: pcwd_pci: Temperature overheat trip!

You mean syzbot now complains that a driver is doing exactly what
it is supposed to be doing ? Really ?

It is not surprising that more and more people consider syzbot reports
to be just noise.

Guenter

