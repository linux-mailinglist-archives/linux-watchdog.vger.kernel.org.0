Return-Path: <linux-watchdog+bounces-4149-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA4B40A63
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 18:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8181816F8ED
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 16:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C772D5924;
	Tue,  2 Sep 2025 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6rraylx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DE156F5E;
	Tue,  2 Sep 2025 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829886; cv=none; b=GO++QWGHSxT0bLpNlzyPp0x6V5810X1dMDTxqaxw82H8ukuyrWdETw/oqzgqN8TwFjAT6eXVKnI0n2c+gtnjOaUg/20PefsOWKwojv6Z+p2Q4OwW6nlHrA5W58km5j/ZYGF0XXlQV3FoB8SgQUXfvybquzr9E6HmhOjjqNTF7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829886; c=relaxed/simple;
	bh=tSD9itKiPe3X4ZhDbntxIMLloJF3L/mnABW4fk3YfdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRYvxl3sXItzBgDv7mg+n2mKCmstXrihMXGbwYDqpIT6SA3inQqqHEvbA/ZQKngymUDjv6sVwIKYAJRH5y4xnqn/XvAZiWkc1c3F9OkXdvS8Z9XzRgZPL0Y9JjxIYTYcuEE+mjFkzJLB43R8y+EgYvcx/40M4qwfYJueF7WW/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6rraylx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77256200f1bso1789584b3a.3;
        Tue, 02 Sep 2025 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829884; x=1757434684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HN+COPVCGri6ZjLVMZQInLPY/R+zuyJwQNCFo2U4XlA=;
        b=O6rraylxwyTdVYzLq7ke8Ls5VyfEVoA3t/gadQUBETqhp+/H9X5CotoP2JMFFf4X8t
         L6kKjE7dyaHk9JHDZKtj49GZ3PSIFiIZW0y7UTHKk2i5D9qGug3DqHTPQCpL6VFlGbhA
         RZHoIA15psJ3C5raggy3K6VfwhvuP9il+T5EP4VezHJy+3QbPJjzd0r4upK771SViMoj
         bv4P2s9eeyAfIoXtEpdBwA4I/x35YYWK8OAZlwAedv8g1yYf/jWzmb8PXzXEzJwDdQu5
         7hrlEDezcLZnTZd0phb/fYGR7bZAGaqV4JrNqOKUN6FihQRd6gtGRDTQSUJv3Y8DOu1h
         u2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829884; x=1757434684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN+COPVCGri6ZjLVMZQInLPY/R+zuyJwQNCFo2U4XlA=;
        b=vN745rudcmoFUKtUUGdytVfSQj98NjuVFuv7tb0JQ3lbO5IqJSBE/JB05tRkzmpKLd
         LLiO7qkF+6aehsE5943xhiiFW2r1XkB0c5B/r5PyOa7FJH8pQ7z5/nbni/xn+FR0tBst
         rdD2km8RWmP/5RM5obj4JTgFyDlIrPB0Ac/AkxR0DJkfBv0LYQRfUoiqFStjjV0LrxYi
         WtHQKDLsLa70jcn5jkK0NxFby3TYk6t0IiOURvzaO1bVsb/qalaebvA9esVXjKncl0ob
         NJc2RuwGZTfecOfDrJxpXyvOZqOK74PTRMxr+YwfpvfxSox4t0fiqF482Q9h6Krgo7wM
         W1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbcpN0SJNvOhipKqlX03Xfxjhfko+6eqbklJkg8g/gXC/BzEmGMVRh5RjVXG2tjU9Zqo8ZwlCX15u49cA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxeNseGay31QyWkefcAKabxNZwqihrhBTcoxnwpYtyf5ceeA67
	EL/qeNMPnkcSQzf/cRGCEi+1dCf5ChI7WMPFETdJJAbkHeXJqbkSOmCl
X-Gm-Gg: ASbGncvn1fChuoGQ2vL9hwUgsUmaw7H2WvKetpxybXCk/QqJxWIJLOdRSIpoiuUSYMy
	lKhXZgZIFC9+iZ07HfL1zGn6wXt/s2p9r8/PoO/QvIbI3chF1DKwYe4/nlBdoqOqTNR8VBB4ziV
	iLjMQs0GfnA6qzm8bkn3FfuRwcSjL9iE9p+MMRoMuBsavpLNr0RLzim/u7TWfch703QJA/Rxvn/
	SJzTCh/rKQryQJ3c9SFymniA0SvrPVGiukBbLnG+tXd43CoFSH33MafHaOhpQZ5pHnSuG3TpQI9
	DrbuXOgB9B4YZN+2Ou1F04Skk0TPAmxtAiU7RGlBJ6yphdsMTvSQq3Jh2cFGsio4UZLg4FoZHVP
	ZR0EYPirpbtz6HKSSDhKEUZH2cnZkJW89UguiRIxAvjBJstDjZYpoXv2xjNGVKW8AEhTiKYM=
X-Google-Smtp-Source: AGHT+IH9FEctrboMR+DokzmTxS4jNlLRAjHb1U3PtF98AsksqY+mmii9oNeP6MFv7NT8EqMdTid79A==
X-Received: by 2002:a17:903:37c4:b0:249:2e21:dab4 with SMTP id d9443c01a7336-24944b576afmr160663195ad.50.1756829884024;
        Tue, 02 Sep 2025 09:18:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da28a2sm134032275ad.71.2025.09.02.09.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:18:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <16b6cc01-90bc-42cb-936a-d0a20266e4a3@roeck-us.net>
Date: Tue, 2 Sep 2025 09:18:02 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: mpc8xxx_wdt: Reload the watchdog timer when
 enabling the watchdog
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <7cfd025ca62fb501dff1f0f923091415a5bc663f.1755002982.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <7cfd025ca62fb501dff1f0f923091415a5bc663f.1755002982.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/25 05:51, Christophe Leroy wrote:
> When the watchdog gets enabled with this driver, it leaves enough time
> for the core watchdog subsystem to start pinging it. But when the
> watchdog is already started by hardware or by the boot loader, little
> time remains before it fires and it happens that the core watchdog
> subsystem doesn't have time to start pinging it.
> 
> Until commit 19ce9490aa84 ("watchdog: mpc8xxx: use the core worker
> function") pinging was managed by the driver itself and the watchdog
> was immediately pinged by setting the timer expiry to 0.
> 
> So restore similar behaviour by pinging it when enabling it so that
> if it was already enabled the watchdog timer counter is reloaded.
> 
> Fixes: 19ce9490aa84 ("watchdog: mpc8xxx: use the core worker function")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>


