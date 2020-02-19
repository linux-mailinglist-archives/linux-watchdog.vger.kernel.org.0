Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DE01652E2
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 00:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgBSXFK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 18:05:10 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41317 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgBSXFI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 18:05:08 -0500
Received: by mail-il1-f194.google.com with SMTP id f10so22054618ils.8
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 15:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C4rTZrvjd+k43gH59N0+bWBoBUjxR7f3cs7vatzlSe4=;
        b=VGTfGueCM+KyWZU8BdKTSiD81U6AeL1BlAl5hB3Hh1E7L8o0QADNfN3PnyJ8INQ4R5
         VcIQ2vNhiXgA8xQUIgGArs3zlHsQei8Q7P1pH+n3bhZaGGQKa6ql9f3KtU7TAcwBD1sC
         /5ORI1SfifdkmxAVrow86X+yCVVLuqbvVHtMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C4rTZrvjd+k43gH59N0+bWBoBUjxR7f3cs7vatzlSe4=;
        b=aBNoS9E5AqC+9HGcgr+zkAxcIq8OgHzsNqnmk7DPH5wOPdIWIvj+Ve4gzrHm9bY/qU
         jsnvWjjzZtoFDLapfGVb8lb4UYl0KNQbiPJpLPmMW/yS0MUGjXW/H/u9p+stqxbz9ZWT
         6NUKCWpR23DMYwCWG1MliFkLEUXiU+kotmWkTLLsrdDmIAI7FyMZ4B7Z0q//bKwo5n9D
         rzMC6JWL8oeWK/PKEC50wFuo2o4rbsGIr0ulSUBLL7k3rg5eCXCeqge6z9QxIRAAhzfX
         OhvjpxSARVGo1id3I3SvIDWG2EeAx5mtFx1dtFXXlTmqI1DX3m1wwguf3ayLfPCPAU2c
         SMEA==
X-Gm-Message-State: APjAAAUI+a9EuSYpf3UTiGX93ZoHv/CVYYMqO/9Cdpe7g5t4nbOhk5wj
        jw+iit0nvBSfSkD+5NaziHRrxqfYMbVFHglOGecglA==
X-Google-Smtp-Source: APXvYqz0Hv+AqnqULyyOEjWy2y/iGz/X3D6tQWeT971GwBfXnyFor9qS0ZWsIGSLE44SwblEyg4zITIUPLDiEw5WlBY=
X-Received: by 2002:a92:8c54:: with SMTP id o81mr26451570ild.163.1582153506521;
 Wed, 19 Feb 2020 15:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid> <20200219223046.GA16537@bogus>
In-Reply-To: <20200219223046.GA16537@bogus>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 19 Feb 2020 15:04:54 -0800
Message-ID: <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Rob Herring <robh@kernel.org>
Cc:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> You are not the first 'watchdog in firmware accessed via an SMC call'.
> Is there some more detail about what implementation this is? Part of
> TF-A? Defined by some spec (I can dream)?

This is just some random implementation written by me because we
needed one. I would like it to be the new generic implementation, but
it sounds like people here prefer the naming to be MediaTek specific
(at least for now). The other SMC watchdog we're aware of is
imx_sc_wdt but unfortunately that seems to hardcode platform-specific
details in the interface (at least in the pretimeout SMC) so we can't
just expand that. With this driver I tried to directly wrap the kernel
watchdog interface so it should be platform-agnostic and possible to
expand this driver to other platforms later if desired. The SMC
function ID would still always have to be platform-specific,
unfortunately (but we could pass it in through the device tree), since
the Arm SMC spec doesn't really leave any room for OS-generic SMCs
like this.
