Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146B6220A9E
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jul 2020 13:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgGOLB6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jul 2020 07:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGOLB5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jul 2020 07:01:57 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD02C061755
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Jul 2020 04:01:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so5304840wml.3
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Jul 2020 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=VysjstAisONRVtX8mBPp10JLRFIB3MVr3nDjYfLOD1c=;
        b=ci7D9jiYPGF9eveMSN+j3u9/0NENhm4YI61JT34vf5mR2rPUuKrjkiRiMLSfs8ODKQ
         37epPs/PQEwpSBWgVfBs8qOAZesrbI/7POuA6PP0VVL55kqF3g8YSacdQfQn6097wQHW
         3w6p3W8wZV5T8YWaJXL4EgU3PQPxxk/A7l/iht/0RUiitIHTb69xFmNOs0xj5P5LIdZG
         5Dq4vdT+LlmyztYVEwmqX9yD2to2TZcemqEdKlqTAC32TqpFQ3ppUj5gdQp1dQtN/Qmv
         HdvDoW+kpIELecapFmepKqTgQBhWfRGQDFzuQcei4K955tUIPQmyRac5AiRCbj6QPLru
         nitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=VysjstAisONRVtX8mBPp10JLRFIB3MVr3nDjYfLOD1c=;
        b=i0YBLN6k7Buhd16Kt3QX6mK3qmjF/9yV1piqePPOMvqwV/qUCPsy/uJ9KAipedZD6v
         uuzbqQoBUy15TNx9onvXTPL2TMnpVSKNJwCs1yKCOKUCZu/fyqOiXafDoxyJ4Ie3014h
         N9hMtJLgZwuOJ1AI8rWYF2kfL1fRV6MF2SezWZ+qCVLsnRNcPnJp3OFICPSU8pSJVMLP
         ptJiVhmHnrMNhBC1dNZn4eDp7QRa/VbXBpcQWLqIri1rNabiN0XO2FuKQLe598GIRaEy
         w7h7gVRAJrAAavkyfW3aVenXG3l9KaKzgA+mSJ7DhPwFzhkNUPK4Pfg5mQkHjDcVZOEy
         GNZg==
X-Gm-Message-State: AOAM531rGFQfTTJNy0e5MykXbPOdJSSKUU3wBLzboNGq7XxfRYsZrvfu
        cx3nhdxFz9E6LIbzWkwFCAsIXTbmYMHNF5KpIo4=
X-Google-Smtp-Source: ABdhPJxO3DqFcfjyGElI5EimBQKnJHKwVW+9lEs92XFDPu2TbUHED731KHU6nEVh4qJ4dUmhGw5hR01L89OUKUNNvqc=
X-Received: by 2002:a1c:6805:: with SMTP id d5mr7887398wmc.19.1594810916126;
 Wed, 15 Jul 2020 04:01:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: yoshikoazumi9@gmail.com
Received: by 2002:a7b:c151:0:0:0:0:0 with HTTP; Wed, 15 Jul 2020 04:01:55
 -0700 (PDT)
From:   yoshiko azumi <yoshikoazumi09@gmail.com>
Date:   Wed, 15 Jul 2020 14:01:55 +0300
X-Google-Sender-Auth: Vx5Wz-hHRCSdk49s8pyvyJjxfME
Message-ID: <CADeAodPh8nSKhQioA6r1ddm3FnNqW20EMKgu-pDqWS1wZ1tLvg@mail.gmail.com>
Subject: =?UTF-8?B?57eK5oCl6L+U5L+h?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

5oSb44GZ44KL44GT44KT44Gr44Gh44Gv44CBDQrnp4Hjga/jgZPjga7miYvntJnjgpLjgIHmgrLj
gZfjgb/jgavmuoDjgaHjgZ/mhJ/mg4XnmoTjgarjga/jgZfjgZTjga7prYLjgYvjgonmm7jjgYTj
gabjgYTjgb7jgZnjgILnp4Hjga7mnIDlvozjga7poZjjgYTjgpLlrp/ooYzjgZnjgovjgZ/jgoHj
gavjgIHopqrliIfjgafli4fmsJfjga7jgYLjgovkurrjgYvjgonjga7mgJ3jgYTjgoTjgorjgYzl
v4XopoHjgafjgZnjgILnp4Hjga/np4Hjga7kurrnlJ/jgpLoqpPjgYTjgb7jgZnjgILjgYLjgarj
gZ/jga7lv4PjgYzntJTnsovjgafoqqDlrp/jgafjgYLjgovpmZDjgorjgIHjgYLjgarjgZ/jgYzj
gZPjga7ml6XjgpLlvozmgpTjgZfjgarjgYTjgZPjgajjgpLntITmnZ/jgZfjgb7jgZkNCg0K5pWF
44OP44Oz44OV44Oq44O85rCP44Gu5aWl5qeY44Gn44GC44KL5a6J56mN6Imv5a2Q44GV44KT44Gn
44GZ44CC5pel5pys5Lq644Gn44GZ44CC5aSr44Gv44Ki44Oh44Oq44Kr5aSn5L2/6aSo44Ov44K3
44Oz44OI44OzRC5D44GrMTHlubTplpPli6Tli5njgZfjgIHjgZ3jga7lvozjgIHoh7Tlkb3nmoTj
garoh6rli5Xou4rkuovmlYXjgafkuqHjgY/jgarjgorjgb7jgZfjgZ/jgIINCjIwMTPlubTjga7l
vbzjga7mrbvlvozjgILnp4Hjga/lho3lqZrjgZfjgarjgYTjgZPjgajjgpLmsbrjgoHjgZ/jgIEN
Cg0K56eB44Gf44Gh44Gv5a2Q5L6b44Gq44GX44GnMTDlubTplpPntZDlqZrjgZfjgb7jgZfjgZ/j
gILnp4Hjga7lpKvjga/lvozjgavkuqHjgY/jgarjgorjgb7jgZfjgZ8NCjLpgLHplpPjgaDjgZHn
tprjgYTjgZ/nn63jgYTnl4XmsJfjgILkuqHjgY/jgarjgaPjgZ/lpKvjga/jgIHjg4jjg6vjgrPj
ga7pioDooYzjgavnt4/poY05NTDkuIfjg4njg6vjgpLpoJDph5HjgZfjgb7jgZfjgZ/jgILpioDo
oYzjga7ntYzllrbogIXjga/jgIHjgZPjga7jg5XjgqHjg7Pjg4njga7jg6rjg6rjg7zjgrnjgavn
vbLlkI3jgZnjgovjgZ/jgoHjgavliY3lkJHjgY3jgavmnaXjgovjgYvjgIHnp4HjgYzmnaXjgovj
gZPjgajjgYzjgafjgY3jgarjgYTloLTlkIjjgavku6Pjgo/jgorjgavnp4Hjga7ku6Pjgo/jgorj
gavlj5fjgZHlj5bjgovjgZ/jgoHjgavoqrDjgYvjgavmib/oqo3jga7miYvntJnjgpLnmbrooYzj
gZnjgovlj5fnm4rogIXjgajjgZfjgabnp4HjgpLmm7jjgYTjgZ/jgaDjgZHjgafjgZnjgIINCg0K
54++5Zyo44CB56eB44Gv5rK755mC44KS5Y+X44GR44Gm44GE44KL44Ot44Oz44OJ44Oz44Gu55eF
6Zmi44Gr44GE44G+44GZDQrpo5/pgZPjgYzjgpPjga7jgZ/jgoHjgILnp4Hjga7ljLvogIXjga/n
p4HjgavmlbDlgIvjgZfjgYvjgarjgYTjgajnp4HjgavoqIDjgaPjgZ8NCueUn+OBjeOCi+aciOOA
guOBk+OBruOBiumHkeOBjOWIhumFjeOBleOCjOOCi+OBruOCkuimi+OBn+OBhOOBruOBr+engeOB
ruacgOW+jOOBrumhmOOBhOOBp+OBmQ0K5oWI5ZaE5Zuj5L2TL+iyp+OBl+OBhOS6uuOAheOAgeen
geOBruWkq+OBruimquaImuOChOWPi+S6uuOBjOeXheawl+S7peadpeengeOBruiyoeeUo+OBruWk
muOBj+OCkueVpeWlquOBl+OBpuOBjeOBn+OBruOBp+OAgeengeOBr+W9vOOCieOBq+OBk+OBruWk
p+OBjeOBquiyrOS7u+OCkuWnlOOBreOCi+OBqOOBhOOBhuiLpueXm+OBq+iAkOOBiOOCi+OBk+OB
qOOBjOOBp+OBjeOBvuOBm+OCk+OAgg0KDQrpioDooYzjgYvjgonos4fph5HjgpLlj5fjgZHlj5bj
gorjgIHmhYjlloTlm6PkvZPjgavjga82MO+8heOCkuS9v+eUqOOBl+OAgeaui+OCiuOBrjQw77yF
44Gv5pys5Lq644Gr5q6L44GX44Gm44GP44KM44KL5q2j55u044Gq5Lq644KS5o6i44GX44Gm44GE
44G+44GZ44CCDQpHb29nbGXjgafjgqLjg6Hjg6rjgqvljLvlrabjga7noJTnqbbjgpLjgZfjgabj
gYTjgovjgajjgY3jgavjgYLjgarjgZ/jga7jg6Hjg7zjg6vjgavlh7rjgY/jgo/jgZfjgIHjgYLj
garjgZ/jga7jgqLjgqvjgqbjg7Pjg4jjgpLopovjgaTjgZHjgb7jgZfjgZ/jgILnp4HjgYzjgZPj
ga7msbrlrprjgpLkuIvjgZfjgZ/jga7jga/jgIHjgZPjga7jgYrph5HjgpLlj5fjgZHntpnjgZDl
rZDkvpvjgYzjgYTjgarjgYTjgZPjgajjgajjgIHlpKvjga7oi6blirTjgZfjgabnqLzjgYTjgaDj
gYrph5HjgYzosqrmrLLjgaropqrpoZ7jgavmgqrnlKjjgZXjgozjgovjgZPjgajjgpLmnJvjgb7j
garjgYTjgZ/jgoHjgafjgZnjgIINCg0K44Gd44KM44Gu5pyA44KC6Imv44GE6YOo5YiG44Gv44CB
5pSv5omV44GE6YqA6KGM44GM6Ki85piO44Os44K/44O844Gn56eB44Gr5om/6KqN44GV44KM44Gf
5om/6KqN44GV44KM44Gf5Lq644Gr6LOH6YeR44KS6Kej5pS+44Gn44GN44KL44KI44GG44Gr6KiA
44Gj44Gf44Gu44Gn44CB6LOH6YeR44Gv44Gp44GT44Gn44KC5b2844G+44Gf44Gv5b285aWz44Gu
6YqA6KGM5Y+j5bqn44Gr6YCB6YeR44GV44KM44G+44GZ5LiW55WM5Lit44CC56eB44GM5rGC44KB
44Gm44GE44KL44Gu44Gv44CB5pyA5b6M44Gu6aGY44GE44KS5Y+244GI44Gm44GP44KM44KL6Kaq
5YiH44Gn5YWD5rCX44Gq5Lq644Gn44GZ44CC5LuK5pel44GC44Gq44Gf44Gr5omL57SZ44KS5pu4
44GP5YmN44Gr44CB56eB44Gv44GT44Gu44Oh44OD44K744O844K444KS6YCB44KL44GT44Go44KS
56WI44KK44CB56eB44Gu57K+56We44GM6Ieq5L+h44KS5LiO44GI44Gm44GP44KM44G+44GX44Gf
44CC56eB44Gu5pmC6ZaT44Gv6ZaT44KC44Gq44GP57WC5LqG44GZ44KL44Gu44Gn44CB56eB44Gv
5a6J5b+D44GX44Gm5LyR44KA5YmN44Gr44GT44Gu5rG65a6a44KS44GX44G+44GX44Gf44CC6L+U
5L+h44GM44GC44KK5qyh56ys44CB5pSv5omV44GE6YqA6KGM44Gu6YCj57Wh5YWI5oOF5aCx44Go
44CB44GT44Gu5Lu244Gr6Zai44GZ44KL6YCj57Wh5pa55rOV44Go6YCj57Wh5YWI44KS44GK55+l
44KJ44Gb44GX44G+44GZ44CC56eB44Gv44G+44Gf44CB44GC44Gq44Gf44Gr5qip6ZmQ5pu444KS
55m66KGM44GX44G+44GZ44CC44GT44KM44Gv44CB44GC44Gq44Gf44GM44GT44Gu6KiA44Gj44Gf
6LOH6YeR44Gu5pyA5Yid44Gu5Y+X55uK6ICF44Gn44GC44KL44GT44Go44KS6Ki85piO44GX44G+
44GZ44CC56We44Gv56eB44Gu576K6aO844GE44Gn44GZ44GL44KJ44CB44GE44Gk44KC56eB44Gu
44Gf44KB44Gr56WI44Gj44Gm44GP44Gg44GV44GE44CC56eB44GM44GC44Gq44Gf44Gr5b+F6KaB
44Gq44Gu44Gv44CB44GC44Gq44Gf44GM5Y+X44GR5Y+W44Gj44Gf6LOH6YeR44GM44Gd44Gu55uu
55qE44Gu44Gf44KB44Gr5L2/44KP44KM44KL44Go44GE44GG56eY5a+G44Gu5L+d6Ki844Gn44GZ
44CC5LuK5pel44CB5L+h6aC844GZ44KL44Gu44Gv6Zuj44GX44GE44Gn44GZ44GM44CB56eB44Gu
57K+56We44GM44Gq44Gc44GT44KM44KS5Y+X44GR5YWl44KM44CB44GT44KM44Gr44Gk44GE44Gm
44GC44Gq44Gf44Gr44Oh44OD44K744O844K444KS6YCB44KL44GT44Go44KS5om/6KqN44GX44Gf
44Gu44GL44CB56eB44Gr44Gv44KP44GL44KK44G+44Gb44KT44CC56eB44Gu44GK6YeR44Gn6YCD
44GS44Gm44CB56eB44Gu6aGY44GE44KS5Y+244GI44Gq44GE5Lq644GM5qyy44GX44GP44Gq44GE
44GL44KJ44Gn44GZ44CC44GC44Gq44Gf44GM44GT44Gu5Lu244Gr44Gk44GE44Gm56eB44GM6YCj
57Wh44GZ44KL5pyA5Yid44Gn5pyA5b6M44Gu5Lq644Gn44GZ44CC44KI44KN44GX44GR44KM44Gw
44GU5LqG5om/44GP44Gg44GV44GE44CC57eK5oCl44Gu44GU6L+U5L+h44KS44GK5b6F44Gh44GX
44Gm44GK44KK44G+44GZ44CCDQoNCuOCiOOCjeOBl+OBj+OAgQ0K44KI44GX44GT44GV44KT44CC
DQo=
