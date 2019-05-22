Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429B9267D6
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 May 2019 18:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729947AbfEVQPj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 May 2019 12:15:39 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:43527 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbfEVQPj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 May 2019 12:15:39 -0400
Received: by mail-yb1-f196.google.com with SMTP id n145so1065079ybg.10;
        Wed, 22 May 2019 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H2QOYmtrbMv2RwSsZzKZlIgE2lZOebGHxtRTWGwCUK8=;
        b=TsIh23HRLdI8hEqPtQ30fFSZzK3/A1tyuR7wi8bJAddsbCkyN0GMgWgPVR3rgKILCq
         FrjrSON1dGlThNxb6/6otMCvetSODgQPtK+wCIUhqMULhi+c8WlRIZmlkJ0P+HcMxQ8u
         7yPysCT0YucMkd14fGXTR2A7RsGbxmWl/6v+RXwx++xvoi7fJRqw6R9i/QHjVz9JM1Jo
         Q1Qlo/bOw4egn1BpoPLWvnMrKgLZ9NEiLUWJNYq/Hj2xcoWn3Q2P8krIEgqDVbCR0vtm
         ArAa3hmhxNyAeVNo3DWT2VcBqjFu3i1zmzbnIZkNrRlh0EMNdQuROjTN9nfPKbOQ4oNO
         DeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H2QOYmtrbMv2RwSsZzKZlIgE2lZOebGHxtRTWGwCUK8=;
        b=Qi3y8e5hcaBOpW/ZPT5d35OlBGA8YAhnnRZiBDYrTV4Li3wmH35jBiXAIo+Y7tBW8X
         1kiZ8zKzdVyEpdKNfqDm12e6eEMD1ocSDNHeK04M9pncR7b/ugY0zQjsoixqDvyPbnmw
         HiSseIlfn//zb77d3YQ7v+T3qxv8y9YXIIV00MmQHwbCDeHfXMNu24yQ4JY4EROdDHIm
         6J+I3jGvdfbnEa6xC0x1l6x7h+nn6Q7EnCdTMYHUfPxGIa2buClkUac4tblNpnnKOuxP
         d600gnv3lsXl8Movzr15k7nOnx3pMbJCcnPXKT3z5pVTB9Wn57cklE++TNdlN+rgpULN
         6Tnw==
X-Gm-Message-State: APjAAAVzfr7qsZ5uHBbuTD+pLy5xSTTU/G0OJa3z1WZBIC+PkuMMRAZH
        INUal63bVuVPd8O7AZeZ/BK6BojjQ/idJevMLtU=
X-Google-Smtp-Source: APXvYqyPQIgHEnxdgVx+UouRSudO6JPKLPIolrSmSVfkcCwrLtqxxyhpQn1v2Hu8mH5g9waksx4+zTXkVOk8H8NtNxI=
X-Received: by 2002:a25:ae22:: with SMTP id a34mr6825427ybj.438.1558541737775;
 Wed, 22 May 2019 09:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190521160330.28402-1-peron.clem@gmail.com> <20190521160330.28402-4-peron.clem@gmail.com>
 <20190522103243.mmrfato5p2mhtf4j@flea>
In-Reply-To: <20190522103243.mmrfato5p2mhtf4j@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Wed, 22 May 2019 18:15:26 +0200
Message-ID: <CAJiuCcdaZVLQyupEf8HPaUySakufXXAhzundo6VeyQaAyZ8Trw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Maxime,

On Wed, 22 May 2019 at 12:32, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Tue, May 21, 2019 at 06:03:28PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 has a second watchdog on the r-blocks which is
> > compatible with the A31.
> >
> > This commit add the H6 compatible for the r_watchdog.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Unless you have some evidence that the two blocks are different, then
> you should just reuse the same one.

I have no evidence it's different nor identical, it's not documented
in the user manual.
I thought it would better to have separate bindings in case there is a
difference.
Than don't have and find later that we have to introduce one.

But as you prefer.

Regards,
Cl=C3=A9ment



>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
