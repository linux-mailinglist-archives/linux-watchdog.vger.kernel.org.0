Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2297BC19B
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Oct 2023 23:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbjJFVw6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Oct 2023 17:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjJFVw5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Oct 2023 17:52:57 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AFFF7
        for <linux-watchdog@vger.kernel.org>; Fri,  6 Oct 2023 14:52:56 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59b5484fbe6so31470667b3.1
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Oct 2023 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696629175; x=1697233975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rPxjIeED0bawl/Zg89RjgWrJXCyV4Gh65dmdUfl1ys=;
        b=lrUsV09zVMySgNtvDyftfkWl7pkHalfb0DTW6Dx03WHzK3Zi9WUzWTPpLByNLVMSFo
         UBfHmT5W4ACKf52Bw9YVxPwm8fl5Rgerbis0sFlwebTKyUSFfmeUOc47fU6sa8Msz388
         3FYtqgRf5Zd4nrJAsOiXbFo844+BIxmOpcMvMv3DHxE0jHCSE2wfQ6ZBKWbRxq0JxtWb
         utu/dna0mln/8BgQLjB0cYyJiyKaH8JnuZdAmxCjoMvt6JQwRZ6IYXjEtKa9vPcJxzyh
         0M/kwqXEb7U4S+17YviYSAKPw4CuG1KgznKXtQvCwcgg2xXVzEgf+vSEzSrnCszxb1Hp
         81dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696629175; x=1697233975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rPxjIeED0bawl/Zg89RjgWrJXCyV4Gh65dmdUfl1ys=;
        b=NIZmX+gTTMiY8aKKRgP7WS/ISx0eOSkAgWjMKXDAw6lVOfpSBGtjBROVqmypPWDcx6
         4zpHRN1gT/mN9hlS3ESQgnaIzkswgHi9NLxzlgXE6oaFM+wnJJp5IRf0Q6oeqVsejBxo
         ggN/wwOyld4l5NA4w4b4pTJrCy5HIQO+id3zn8vj5MwwRzttFAGs4bsDbHiw9AYPBMTe
         tE6yuarADw65cDi1a/pXzgTFmvWTN4ccchySli7SUNU4ntLdrY2CWNkn4DgXQlD3Kkq6
         KonWrmYzY70LCPV1Tj4T2TIThq03mufD2kojhf4trtyuuAAVroOJ1Y4Cd3ta2+PtNdug
         7PEQ==
X-Gm-Message-State: AOJu0YyK0Lu9NDWNNUcvYAA7rgIS9du823p44RFr+axRYfHIaMzCR5L3
        ixbjguJnqdGcuM/BZ9guwuAz2Wb00u+NNTh1Q8L9ng==
X-Google-Smtp-Source: AGHT+IFtX2fxe7d3k5oKKf0awkIPkKawjGVBLybPNlpLznR5lXwlZYsZkR+FwG2n0CD+MRFwqqi8iiuKTGPz9YDHAGY=
X-Received: by 2002:a81:524f:0:b0:56d:2d82:63dc with SMTP id
 g76-20020a81524f000000b0056d2d8263dcmr10487001ywb.10.1696629175634; Fri, 06
 Oct 2023 14:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-2-peter.griffin@linaro.org> <419f823c-2476-4aec-b25d-7e6a2994555a@linaro.org>
In-Reply-To: <419f823c-2476-4aec-b25d-7e6a2994555a@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Oct 2023 23:52:44 +0200
Message-ID: <CACRpkdbAFOm07ttP9gXasTkZOc0JC3DKv9wBsVYSV3rEfqi9iQ@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: interrupt-controller: Add gs101
 interrupt controller
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 5, 2023 at 6:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 05/10/2023 17:55, Peter Griffin wrote:

> > Add the gs101 SoC interrupt header that provides human readable
> > constants for all the IRQs in the SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

> > +#define ITNO IRQ_TYPE_NONE
> > +#define ITER IRQ_TYPE_EDGE_RISING
> > +#define ITEF IRQ_TYPE_EDGE_FALLING
> > +#define ITEB IRQ_TYPE_EDGE_BOTH
> > +#define ITLH IRQ_TYPE_LEVEL_HIGH
> > +#define ITLL IRQ_TYPE_LEVEL_LOW
>
> No, these are not bindings.
>
> > +
> > +#define IRQ_ALIVE_EINT0              0
> > +#define IRQ_ALIVE_EINT1              1
>
> We do not keep interrupt numbers as bindings. Please drop entire file.

Agree, but it should be fine to have as a SoC-specific .dtsi under
arch/.../google/gs101-irq.dtsi though!

Yours,
Linus Walleij
