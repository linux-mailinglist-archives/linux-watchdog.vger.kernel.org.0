Return-Path: <linux-watchdog+bounces-418-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBC8325CE
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 09:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4571C21D23
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 08:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDE6D51A;
	Fri, 19 Jan 2024 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cv0McJjk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D1FE560
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653388; cv=none; b=akxZ048tIrtJn0DFnyNowFGE//7Fnw90Er1Au5S0aZtk7Z2BJyoAy8Inehqey8lScXzfl0FpKHiAvlOLSAoCIfTHWYXV/6xPKQPbtn9ivYxYlQrwSunaGWg6gCcOWtUQC9YWwZsuYaeMVd2Y60ljlFR4u/RXjSwrjgwxa5opn7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653388; c=relaxed/simple;
	bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzuneaFnMrwwuXdXqHr8wI+OqQxRk+EoicAv+0qCmDpNbm4/WMXw172E5gNUwPwRlusAj6woEtZmJp0boH21/1037eijWHhu+sFF5nZ9NrxvRmlk81YG5N0lGW6B9W0cSe7kgx0v8R7nug91K0rewy9GqjDx7P8oJZgENDxnFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cv0McJjk; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ccec119587so6927451fa.0
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 00:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653383; x=1706258183; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
        b=cv0McJjkSzluZflw69DMla5BETmh6NaGYKadKR8/IHgpZyRXnfqcz06pAKhx9nQpCF
         nWMdWwTO6dUd2c5dbNEYT5ELtocIRKGcqOl4QOBW5Rb7vZMNmdMpiIlz7FPDFtUXo/9l
         8M5TaCjjxIQ9HLVDJ9Wp6eafXxGt+5deqvfrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653383; x=1706258183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
        b=YzzHvILM1yncf9BfIa98uVEJS639Q21J5ChpDuCWAa/JIESnMlf64dakPgLNVQilz6
         XKgIx46tVWI84Xa6o+n4bodbmqFrQ+Whbve2OlLz/eMZ8o3MMYKUSKnLkQwSd/cbQt6o
         OQcLLz2Cst3DpjWP6IhQTBCbLUs2WBs83YM+xNV/SOPQO8UjavgK++1IpVU2TI1jTa70
         cY+XzTFfTpyjGGRkpV2lsNP8biLal4QyltS8kX3WPWUgD1apE+UUUK0eVagiQYXZa7tp
         z3b8E/r1hvtzCtU8ZA7gy0jZSzBWr3tKYYkkTtW/WIuEhQy11RASgNSNUr9rcYlfj+GX
         k3Lg==
X-Gm-Message-State: AOJu0YyB/ymM9AvJibvK3VUU0DeD1xE+F9+DIAz/t6gkEOnG3zwezrar
	5QBoXN96MXLYG7OJl7FuGNYiKgyjL+VRrC4AYkbL663QRjxWb3ANRXqyyw3Lek0jKzlKsFiHly+
	pDDuN43eUCiwGnMKhDtAMQIA8waIVEY6Wmt3h
X-Google-Smtp-Source: AGHT+IH4bVEhLEi75Db43ItzAD8XcRylKzUeEaDfyXD/kUVcUWrY1OcFmcof4B2w+mM/L10iyzCfvsBqk2QLZ0VxLPc=
X-Received: by 2002:a2e:b707:0:b0:2cd:36ff:4d7d with SMTP id
 j7-20020a2eb707000000b002cd36ff4d7dmr1397341ljo.12.1705653383174; Fri, 19 Jan
 2024 00:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118195325.2964918-1-lma@chromium.org> <20240118195325.2964918-4-lma@chromium.org>
 <afc0a32f-4352-4ce7-a57d-9c5900ba91d1@roeck-us.net>
In-Reply-To: <afc0a32f-4352-4ce7-a57d-9c5900ba91d1@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 09:36:12 +0100
Message-ID: <CAE5UKNqz27LMTyiRBxQCwmeDCMEtQBPdUTWKQ2HOTxPqFU9ODQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Assuming you drop "-drv",
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks,
> Guenter

I will do so, thank you.

Best regards,
Lukasz

